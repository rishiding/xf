package com.xl.message.mqtt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xl.message.mqtt.MqttGateway;
import com.xl.message.mqtt.constant.Topics;

@Service
public class DeviceMessageService {
	 @Autowired
	 MqttGateway mqttGateway;
	/**
	 * 设备复位
	 * @param ieme
	 */
	public void deviceRest(String ieme){
		mqttGateway.sendToMqtt(Topics.TOPIC_SERVER_DEVICE_RESET.replace(Topics.TOPIC_SERVER_ID, ieme), "1");
	}
}
