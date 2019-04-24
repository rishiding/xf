package com.xl.message.mqtt;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.integration.channel.DirectChannel;
import org.springframework.integration.mqtt.core.DefaultMqttPahoClientFactory;
import org.springframework.integration.mqtt.core.MqttPahoClientFactory;
import org.springframework.integration.mqtt.outbound.MqttPahoMessageHandler;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.MessageHandler;
import com.xl.message.mqtt.config.MqttProperties;

/**
 * 消息发送配置类
* @version:1.0
* @Description: 消息发送配置类
* @author: dingrenxin 
* @date:  2019年4月23日 上午11:15:18
 */
@Configuration
public class MqttOutboundConfiguration {
    @Autowired
    private MqttProperties mqttProperties;
    @Bean
    public MqttPahoClientFactory mqttClientFactory() {
        String[] serverURIs = mqttProperties.getUrl().split(",");
        DefaultMqttPahoClientFactory factory = new DefaultMqttPahoClientFactory();
        factory.setServerURIs(serverURIs);
        factory.setCleanSession(false);
        factory.setConnectionTimeout(mqttProperties.getTimeout());
        factory.setKeepAliveInterval(mqttProperties.getKeepalive());
        factory.setUserName(mqttProperties.getUsername());
        factory.setPassword(mqttProperties.getPassword());
        return factory;
    }

    @Bean
    @ServiceActivator(inputChannel = "mqttOutboundChannel")
    public MessageHandler mqttOutbound() {
        MqttPahoMessageHandler messageHandler=new MqttPahoMessageHandler(mqttProperties.getServerId()+UUID.randomUUID().toString().replaceAll("-", ""), mqttClientFactory());       
        messageHandler.setAsync(true);
        messageHandler.setDefaultTopic(mqttProperties.getTopics());
        return messageHandler;
    }

    @Bean
    public MessageChannel mqttOutboundChannel() {
        return new DirectChannel();
    }
}