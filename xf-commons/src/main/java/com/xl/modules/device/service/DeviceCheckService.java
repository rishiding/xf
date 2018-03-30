/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.device.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xl.common.service.CrudService;
import com.xl.modules.device.entity.DeviceCheck;
import com.xl.modules.device.dao.DeviceCheckDao;

/**
 * 消防设施巡检Service
 * @author dingrenxind
 * @version 2018-03-30
 */
@Service
@Transactional(readOnly = true)
public class DeviceCheckService extends CrudService<DeviceCheckDao, DeviceCheck> {

	
}