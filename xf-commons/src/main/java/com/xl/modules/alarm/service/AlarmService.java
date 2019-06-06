/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.alarm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xl.common.persistence.Page;
import com.xl.common.service.CrudService;
import com.xl.modules.alarm.entity.Alarm;
import com.xl.modules.alarm.dao.AlarmDao;

/**
 * 报警记录Service
 * @author dingrenxin
 * @version 2019-06-04
 */
@Service
@Transactional(readOnly = true)
public class AlarmService extends CrudService<AlarmDao, Alarm> {

	public Alarm get(String id) {
		return super.get(id);
	}
	
	public List<Alarm> findList(Alarm alarm) {
		return super.findList(alarm);
	}
	
	public Page<Alarm> findPage(Page<Alarm> page, Alarm alarm) {
		return super.findPage(page, alarm);
	}
	
	@Transactional(readOnly = false)
	public void save(Alarm alarm) {
		super.save(alarm);
	}
	
	@Transactional(readOnly = false)
	public void delete(Alarm alarm) {
		super.delete(alarm);
	}
	
}