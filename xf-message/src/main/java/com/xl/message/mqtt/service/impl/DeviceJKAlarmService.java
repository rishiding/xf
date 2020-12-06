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
 * 
 * @author dingrenxin
 *
 */
@Component(Topics.TOPIC_DEVICE_XF_ALARM)
public class DeviceJKAlarmService implements EquipmentUpload {
	@Autowired
	private FloorDeployService floorDeployService;
	@Autowired
	private AlarmService alarmService;

	@Override
	public void equipment(String topic, String imemid, String msg) {
		Alarm a=JSON.parseObject(msg, Alarm.class);
		a.setSysType(Topics.DEVICE_TYPE_JK);
		if(StringUtils.isNoneBlank(a.getLoopNumber())){
			a.setFloorId(floorDeployService.findFloorByLoopNumber(a.getLoopNumber()).getId());
		}
		a.setIeme(imemid);
		alarmService.save(a);

	}

}
