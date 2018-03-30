/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.device.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xl.common.config.Constants;
import com.xl.common.persistence.Page;
import com.xl.common.service.CrudService;
import com.xl.common.utils.DateUtils;
import com.xl.modules.device.entity.Device;
import com.xl.modules.device.dao.DeviceDao;

/**
 * 消防设施Service
 * @author dingrenxin
 * @version 2018-03-30
 */
@Service
@Transactional(readOnly = true)
public class DeviceService extends CrudService<DeviceDao, Device> {
	@Override
	 public Page<Device> findPage(Page<Device> page, Device entity) {
			entity=getDevice(entity);
	        entity.setPage(page);
	        
	        page.setList(dao.findList(entity));
	        return page;
	    }
	protected Device getDevice(Device entity){
		if(entity.getQueryType().equals(Constants.DEVICE_DATE_TYPE_MONTH)){
			entity.setEndDate(new java.util.Date());
			entity.setStartDate(DateUtils.getDateByPlus(entity.getEndDate(), -30));
		}else{
			entity.setEndDate(new java.util.Date());
			entity.setStartDate(DateUtils.getDateByPlus(entity.getEndDate(), -7));
		}
		
		return entity;
	}
}