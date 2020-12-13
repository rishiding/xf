package com.xl.message.mqtt.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.xl.message.mqtt.constant.Topics;
import com.xl.message.mqtt.service.EquipmentUpload;
import com.xl.modules.alarm.entity.Alarm;
import com.xl.modules.alarm.service.AlarmService;
import com.xl.modules.sys.service.FloorDeployService;

/**
 * 疏散报价
 * GetCommunity
 * @author dingrenxin
 *
 */
@Component(Topics.TOPIC_DEVICE_FLOORS)
public class GetDeviceFloorsService implements EquipmentUpload {
	@Autowired
	private FloorDeployService floorDeployService;
	@Autowired
	private AlarmService alarmService;

	@Override
	public void equipment(String topic, String imemid, String msg) {
		//TODO

	}

}
