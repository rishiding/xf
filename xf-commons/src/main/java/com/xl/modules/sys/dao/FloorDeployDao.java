/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.dao;

import com.xl.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.xl.modules.sys.entity.FloorDeploy;

/**
 * 楼层部署DAO接口
 * @author dingrenxin
 * @version 2020-05-23
 */
@Mapper
public interface FloorDeployDao extends CrudDao<FloorDeploy> {
	int deleteByFloorId(FloorDeploy fd);
}