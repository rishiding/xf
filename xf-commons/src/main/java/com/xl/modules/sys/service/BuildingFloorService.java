/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.xl.common.service.CrudService;
import com.xl.common.utils.StringUtils;
import com.xl.modules.sys.entity.BuildingFloor;
import com.xl.modules.sys.entity.FloorDeploy;
import com.xl.modules.sys.dao.BuildingFloorDao;
import com.xl.modules.sys.dao.FloorDeployDao;

/**
 * 建筑楼层Service
 * @author rishi
 * @version 2018-03-19
 */
@Service
@Transactional(readOnly = true)
public class BuildingFloorService extends CrudService<BuildingFloorDao, BuildingFloor> {

	@Autowired
	FloorDeployDao fDao;
	
	@Transactional(readOnly = false)
	public void updateMaps(BuildingFloor buildingFloor) {
		BuildingFloor old=dao.get(buildingFloor);
		/*System.out.println("old:"+old.getDragInfos().hashCode());
		System.out.println("new:"+buildingFloor.getDragInfos().hashCode());*/
		if(StringUtils.isBlank(old.getDragInfos())||(old.getDragInfos().hashCode()!=buildingFloor.getDragInfos().hashCode())){
			FloorDeploy fd=new FloorDeploy();
			fd.setFloorId(buildingFloor.getId());
			fDao.deleteByFloorId(fd);			
			dao.updateMaps(buildingFloor);
			List<FloorDeploy> list=JSON.parseArray(buildingFloor.getDragInfos(), FloorDeploy.class);
			list.forEach(a->{
				a.setFloorId(buildingFloor.getId());
				a.preInsert();
				fDao.insert(a);
			});
		}
	}
	
	
	
}