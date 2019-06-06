/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.alarm.dao;

import com.xl.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.xl.modules.alarm.entity.Alarm;

/**
 * 报警记录DAO接口
 * @author dingrenxin
 * @version 2019-06-04
 */
@Mapper
public interface AlarmDao extends CrudDao<Alarm> {
	
}