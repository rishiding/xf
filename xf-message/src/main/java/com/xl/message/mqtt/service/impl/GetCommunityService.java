package com.xl.message.mqtt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.xl.common.config.Global;
import com.xl.message.mqtt.MqttGateway;
import com.xl.message.mqtt.constant.Topics;
import com.xl.message.mqtt.service.EquipmentUpload;
import com.xl.modules.sys.entity.Building;
import com.xl.modules.sys.service.BuildingService;

/**
 * 疏散报价
 * GetCommunity
 * @author dingrenxin
 *
 */
@Component(Topics.TOPIC_DEVICE_GETCOMMUNITYS)
public class GetCommunityService implements EquipmentUpload {
	@Autowired
	private BuildingService buildingService;	
	@Autowired
	MqttGateway mqttGateway;

	@Override
	public void equipment(String topic, String imemid, String msg) {
		Building bl=buildingService.getByIeme(imemid);
		if(bl!=null){
			String url=Global.getConfig("view.building.url")+"?id="+bl.getId();
			JSONObject m = new JSONObject();
			m.put("url", url);
			mqttGateway.sendToMqtt(Topics.TOPIC_SERVER_DEVICE_COMMUNITY.replace(Topics.TOPIC_SERVER_ID, imemid), m.toJSONString());
		}
	}

}
