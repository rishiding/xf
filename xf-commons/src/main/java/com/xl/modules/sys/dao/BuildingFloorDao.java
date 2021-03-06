/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.dao;

import com.xl.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.xl.modules.sys.entity.BuildingFloor;

/**
 * 建筑楼层DAO接口
 * @author rishi
 * @version 2018-03-19
 */
@Mapper
public interface BuildingFloorDao extends CrudDao<BuildingFloor> {
	int updateMaps(BuildingFloor floor);
	
}