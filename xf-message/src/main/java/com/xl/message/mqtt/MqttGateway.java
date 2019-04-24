package com.xl.message.mqtt;

import org.springframework.integration.annotation.MessagingGateway;
import org.springframework.integration.mqtt.support.MqttHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.stereotype.Component;

/**
 * 
* @version:1.0
* @Description: 消息发送service，可以直接调用来发送消息
* @author: dingrenxin 
* @date:  2019年4月23日 上午11:16:28
 */
@Component
@MessagingGateway(defaultRequestChannel = "mqttOutboundChannel")
public interface MqttGateway {

    void sendToMqtt(String data);
    void sendToMqtt(@Header(MqttHeaders.TOPIC) String topic, String payload);
    void sendToMqtt(@Header(MqttHeaders.TOPIC) String topic, @Header(MqttHeaders.QOS) int qos, String payload);

}