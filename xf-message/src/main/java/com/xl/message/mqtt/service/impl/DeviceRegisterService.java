package com.xl.message.mqtt.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.xl.message.mqtt.constant.Topics;
import com.xl.message.mqtt.service.EquipmentUpload;
import com.xl.modules.terminal.entity.Terminal;
import com.xl.modules.terminal.service.TerminalService;

/**
 * 设备注册
 * 
 * @author dingrenxin
 *
 */
@Component(Topics.TOPIC_DEVICE_ID)
public class DeviceRegisterService implements EquipmentUpload {
	@Autowired
	private TerminalService terminalService;

	@Override
	public void equipment(String topic, String ieme, String message) {
		try {
			Terminal terminal = JSON.parseObject(message, Terminal.class);
			Terminal old = terminalService.get(terminal);
			if (old == null) {
				terminal.setLastOnlineTime(new Date());
				terminal.setOnline(Topics.DEVICE_ONLINE);
				terminalService.save(terminal);
			} else {
				old.setLastOnlineTime(new Date());
				old.setOnline(Topics.DEVICE_ONLINE);
				old.setCcid(terminal.getCcid());
				terminalService.save(old);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
