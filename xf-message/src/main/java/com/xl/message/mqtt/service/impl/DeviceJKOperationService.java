package com.xl.message.mqtt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.xl.message.mqtt.constant.Topics;
import com.xl.message.mqtt.service.EquipmentUpload;
import com.xl.modules.operation.entity.Operation;
import com.xl.modules.operation.service.OperationService;

/**
 * 疏散报价
 * 
 * @author dingrenxin
 *
 */
@Component(Topics.TOPIC_DEVICE_JK_OPERATION)
public class DeviceJKOperationService implements EquipmentUpload {
	@Autowired 
    private OperationService operationService;

	@Override
	public void equipment(String topic, String imemid, String msg) {
		Operation o=JSON.parseObject(msg,Operation.class);
		o.setSysType(Topics.DEVICE_TYPE_JK);
		o.setIeme(imemid);
		operationService.save(o);      

	}

}
