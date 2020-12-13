package com.xl.message.mqtt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.xl.common.utils.DateUtils;
import com.xl.message.mqtt.MqttGateway;
import com.xl.message.mqtt.constant.Topics;
import com.xl.message.mqtt.service.EquipmentUpload;

/**
 * 疏散报价
 * GetCommunity
 * @author dingrenxin
 * 
 */
@Component(Topics.TOPIC_DEVICE_HEART)
public class DeviceHeartService implements EquipmentUpload {
	 @Autowired
	 MqttGateway mqttGateway;

	@Override
	public void equipment(String topic, String imemid, String msg) {
		if(imemid.equals("test")){
			return;
		}
		JSONObject m = new JSONObject();
		m.put("date", DateUtils.getDateTime());
		 mqttGateway.sendToMqtt(Topics.TOPIC_SERVER_DEVICE_HEART.replace(Topics.TOPIC_SERVER_ID, imemid), m.toJSONString());

	}

}
