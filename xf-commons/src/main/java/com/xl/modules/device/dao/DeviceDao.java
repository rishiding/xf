/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.device.dao;

import com.xl.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.xl.modules.device.entity.Device;

/**
 * 消防设施DAO接口
 * @author dingrenxin
 * @version 2018-03-30
 */
@Mapper
public interface DeviceDao extends CrudDao<Device> {
	 int baoxiu(Device entity);
}