/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xl.common.config.Constants;
import com.xl.common.persistence.Page;
import com.xl.common.service.CrudService;
import com.xl.modules.sys.entity.Building;
import com.xl.modules.alarm.vo.AlarmBuildVo;
import com.xl.modules.sys.dao.BuildingDao;

/**
 * 消防建筑Service
 * @author rishi
 * @version 2018-03-19
 */
@Service
@Transactional(readOnly = true)
public class BuildingService extends CrudService<BuildingDao, Building> {

	public Building get(String id) {
		return super.get(id);
	}
	
	public Building getByIeme(String ieme) {
		Building building=new Building();
		building.setIeme(ieme);
		return dao.getByIeme(building);
	}
	
	public List<Building> findList(Building building) {
		return super.findList(building);
	}
	
	public Page<Building> findPage(Page<Building> page, Building building) {
		return super.findPage(page, building);
	}
	
	@Transactional(readOnly = false)
	public void save(Building building) {
		super.save(building);
	}
	
	@Transactional(readOnly = false)
	public void delete(Building building) {
		super.delete(building);
	}
	
	public AlarmBuildVo findAlarmBuild(Building building){
		AlarmBuildVo vo=new AlarmBuildVo();
		for(Building b:findList(building)){
			vo.getList().add(b.toBuildVo());
			vo.setTotalBuild(vo.getTotalBuild()+1);
			if(b.getStatus().equals(Constants.ALARM_FIRE)){//火灾
				vo.setAlarmBuild(vo.getAlarmBuild()+1);
			}else if(b.getStatus().equals(Constants.ALARM_FAULT)){//故障
				vo.setFaltBuild(vo.getFaltBuild()+1);
			}else{//正常建筑
				vo.setNormalBuild(vo.getNormalBuild()+1);
			}
		}
		return vo;
		
	}
	
}