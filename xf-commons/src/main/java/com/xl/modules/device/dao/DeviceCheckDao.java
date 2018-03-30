/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.device.dao;

import com.xl.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.xl.modules.device.entity.DeviceCheck;

/**
 * 消防设施巡检DAO接口
 * @author dingrenxind
 * @version 2018-03-30
 */
@Mapper
public interface DeviceCheckDao extends CrudDao<DeviceCheck> {
	int check(DeviceCheck entity);
}