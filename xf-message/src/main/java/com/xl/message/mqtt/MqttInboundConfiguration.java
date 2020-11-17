package com.xl.message.mqtt;


import lombok.extern.slf4j.Slf4j;

import java.util.Date;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.integration.channel.DirectChannel;
import org.springframework.integration.core.MessageProducer;
import org.springframework.integration.mqtt.core.MqttPahoClientFactory;
import org.springframework.integration.mqtt.inbound.MqttPahoMessageDrivenChannelAdapter;
import org.springframework.integration.mqtt.support.DefaultPahoMessageConverter;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.MessageHandler;
import org.springframework.messaging.MessagingException;

import com.alibaba.fastjson.JSON;
import com.xl.message.mqtt.config.MqttProperties;
import com.xl.message.mqtt.constant.Topics;
import com.xl.modules.alarm.entity.Alarm;
import com.xl.modules.alarm.service.AlarmService;
import com.xl.modules.operation.entity.Operation;
import com.xl.modules.operation.service.OperationService;
import com.xl.modules.sys.service.FloorDeployService;
import com.xl.modules.terminal.entity.Terminal;
import com.xl.modules.terminal.service.TerminalService;

/**
 * 
* @version:1.0
* @Description: 消息接收处理类
* @author: dingrenxin 
* @date:  2019年4月23日 上午11:14:59
 */
@Configuration
@Slf4j
public class MqttInboundConfiguration {
    @Autowired
    private MqttProperties mqttProperties;
    @Autowired 
    private TerminalService terminalService;
    @Autowired 
    private AlarmService alarmService;
    @Autowired 
    private OperationService operationService;
    @Autowired
    private FloorDeployService floorDeployService;
    @Bean
    public MessageChannel mqttInputChannel() {
        return new DirectChannel();
    }
    @Bean
    public MessageProducer inbound(MqttPahoClientFactory mqttPahoClientFactory) {
        String[] inboundTopics = mqttProperties.getTopic().split(",");
        MqttPahoMessageDrivenChannelAdapter adapter =
                new MqttPahoMessageDrivenChannelAdapter(mqttProperties.getUrl(), mqttProperties.getClientId()+ UUID.randomUUID().toString().replaceAll("-", ""),  mqttPahoClientFactory,inboundTopics);
        adapter.setCompletionTimeout(mqttProperties.getTimeout());
        adapter.setConverter(new DefaultPahoMessageConverter());
        adapter.setQos(mqttProperties.getQos());
        adapter.setOutputChannel(mqttInputChannel());
        return adapter;
    }

    @Bean
    @ServiceActivator(inputChannel = "mqttInputChannel")
    public MessageHandler handler() {
        return new MessageHandler() {
            @Override
            public void handleMessage(Message<?> message) throws MessagingException {
            	String topic=(String)message.getHeaders().get("mqtt_topic");
            	log.info("topic:"+topic);
            	String msg = (String) message.getPayload();
            	if(topic.equals(Topics.TOPIC_DEVICE_ID)){//设备注册 状态更新
            		Terminal terminal=JSON.parseObject(msg, Terminal.class);
            		Terminal old=terminalService.get(terminal);
            		if(old==null){
            			terminal.setLastOnlineTime(new Date());
            			terminal.setOnline(Topics.DEVICE_ONLINE);
            			terminalService.save(terminal);
            		}else{
            			old.setLastOnlineTime(new Date());
            			old.setOnline(Topics.DEVICE_ONLINE);
            			old.setCcid(terminal.getCcid());            			
            			terminalService.save(old);
            		}
            	}else if(topic.startsWith(Topics.TOPIC_DEVICE_PREFIX)){
            		if(topic.endsWith(Topics.TOPIC_DEVICE_SS_ALARM)){ //疏散系统报警
            			String imemid=topic.substring(Topics.TOPIC_DEVICE_PREFIX.length(), topic.indexOf(Topics.TOPIC_DEVICE_SS_ALARM));
            			Alarm a=JSON.parseObject(msg, Alarm.class);
            			a.setSysType(Topics.DEVICE_TYPE_SS);
            			if(StringUtils.isNoneBlank(a.getLoopNumber())){
            				a.setFloorId(floorDeployService.findFloorByLoopNumber(a.getLoopNumber()).getId());
            			}
            			a.setIeme(imemid);
            			alarmService.save(a);
            		}else if(topic.endsWith(Topics.TOPIC_DEVICE_SS_OPERATION)){ //疏散系统年月检
            			String imemid=topic.substring(Topics.TOPIC_DEVICE_PREFIX.length(), topic.indexOf(Topics.TOPIC_DEVICE_SS_OPERATION));
            			Operation o=JSON.parseObject(msg,Operation.class);
            			o.setSysType(Topics.DEVICE_TYPE_SS);
            			o.setIeme(imemid);
            			operationService.save(o);            			
            		}else if(topic.endsWith(Topics.TOPIC_DEVICE_XF_ALARM)){ //消防系统报警
            			String imemid=topic.substring(Topics.TOPIC_DEVICE_PREFIX.length(), topic.indexOf(Topics.TOPIC_DEVICE_XF_ALARM));
            			Alarm a=JSON.parseObject(msg, Alarm.class);
            			if(StringUtils.isNoneBlank(a.getLoopNumber())){
            				a.setFloorId(floorDeployService.findFloorByLoopNumber(a.getLoopNumber()).getId());
            			}
            			a.setSysType(Topics.DEVICE_TYPE_XF);
            			a.setIeme(imemid);
            			alarmService.save(a);
            		}else if(topic.endsWith(Topics.TOPIC_DEVICE_XF_OPERATION)){ //消防系统年月检
            			String imemid=topic.substring(Topics.TOPIC_DEVICE_PREFIX.length(), topic.indexOf(Topics.TOPIC_DEVICE_XF_OPERATION));
            			Operation o=JSON.parseObject(msg,Operation.class);
            			o.setSysType(Topics.DEVICE_TYPE_XF);
            			o.setIeme(imemid);
            			operationService.save(o);            			
            		}else if(topic.endsWith(Topics.TOPIC_DEVICE_JK_ALARM)){ //监控系统报警
            			String imemid=topic.substring(Topics.TOPIC_DEVICE_PREFIX.length(), topic.indexOf(Topics.TOPIC_DEVICE_JK_ALARM));
            			Alarm a=JSON.parseObject(msg, Alarm.class);
            			a.setSysType(Topics.DEVICE_TYPE_JK);
            			if(StringUtils.isNoneBlank(a.getLoopNumber())){
            				a.setFloorId(floorDeployService.findFloorByLoopNumber(a.getLoopNumber()).getId());
            			}
            			a.setIeme(imemid);
            			alarmService.save(a);
            		}else if(topic.endsWith(Topics.TOPIC_DEVICE_JK_OPERATION)){ //监控系统年月检
            			String imemid=topic.substring(Topics.TOPIC_DEVICE_PREFIX.length(), topic.indexOf(Topics.TOPIC_DEVICE_JK_OPERATION));
            			Operation o=JSON.parseObject(msg,Operation.class);
            			o.setSysType(Topics.DEVICE_TYPE_JK);
            			o.setIeme(imemid);
            			operationService.save(o);            			
            		}
            	}
                log.info("收到消息："+msg);
            }

        };
    }
}
