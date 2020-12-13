package com.xl.message.mqtt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.xl.message.mqtt.MqttGateway;
import com.xl.message.mqtt.constant.Topics;


@Component
public class MQTTTaskService {
	@Autowired
	MqttGateway mqttGateway;
	
	@Scheduled(cron = "*/30 * * * * ?")
    public void execute() {
		mqttGateway.sendToMqtt(Topics.TOPIC_DEVICE_PREFIX+"test"+Topics.TOPIC_DEVICE_HEART, "1");
    }
}
