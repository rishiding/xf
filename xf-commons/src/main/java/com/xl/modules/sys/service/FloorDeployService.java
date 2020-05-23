/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xl.common.service.CrudService;
import com.xl.modules.sys.entity.FloorDeploy;
import com.xl.modules.sys.dao.FloorDeployDao;

/**
 * 楼层部署Service
 * @author dingrenxin
 * @version 2020-05-23
 */
@Service
@Transactional(readOnly = true)
public class FloorDeployService extends CrudService<FloorDeployDao, FloorDeploy> {

	
	@Transactional(readOnly = false)
	public void deleteByFloorId(FloorDeploy floorDeploy) {
		dao.deleteByFloorId(floorDeploy);
	}
	
}