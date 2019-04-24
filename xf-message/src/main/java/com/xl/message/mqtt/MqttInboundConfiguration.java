package com.xl.message.mqtt;


import lombok.extern.slf4j.Slf4j;

import java.util.UUID;

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

import com.xl.message.mqtt.config.MqttProperties;

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
            	log.info("topic:"+message.getHeaders().get("mqtt_topic"));
                log.info("收到消息："+(String) message.getPayload());
            }

        };
    }
}
