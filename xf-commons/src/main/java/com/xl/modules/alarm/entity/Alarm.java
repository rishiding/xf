/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.alarm.entity;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xl.common.persistence.DataEntity;
import com.xl.modules.sys.entity.Building;
import com.xl.modules.sys.entity.BuildingFloor;
import com.xl.modules.sys.utils.DictUtils;

/**
 * 报警记录Entity
 * @author dingrenxin
 * @version 2019-06-04
 */
public class Alarm extends DataEntity<Alarm> {
	
	private static final long serialVersionUID = 1L;
	private String ieme;		// ieme
	private String hostNumber;		// 主机号
	private String loopNumber;		// 回路号
	private String sysType;		// 系统类型
	private String type;		// 报警类型
	private String buildId;//建筑id
	private String floorId; //楼层id
	private Building build;
	private String status;//状态
	private BuildingFloor floor;
	
	public Alarm() {
		super();
	}

	public Alarm(String id){
		super(id);
	}

	@Length(min=1, max=64, message="ieme长度必须介于 1 和 64 之间")
	public String getIeme() {
		return ieme;
	}

	public void setIeme(String ieme) {
		this.ieme = ieme;
	}
	
	@Length(min=0, max=100, message="主机号长度必须介于 0 和 100 之间")
	public String getHostNumber() {
		return hostNumber;
	}

	public void setHostNumber(String hostNumber) {
		this.hostNumber = hostNumber;
	}
	
	@Length(min=0, max=100, message="回路号长度必须介于 0 和 100 之间")
	public String getLoopNumber() {
		return loopNumber;
	}

	public void setLoopNumber(String loopNumber) {
		this.loopNumber = loopNumber;
	}
	
	@Length(min=0, max=255, message="系统类型长度必须介于 0 和 255 之间")
	public String getSysType() {
		return sysType;
	}
	
	public String getSysTypeName() {
		return DictUtils.getDictLabel(sysType, "system_type", "");
	}

	public void setSysType(String sysType) {
		this.sysType = sysType;
	}
	
	@Length(min=0, max=255, message="报警类型长度必须介于 0 和 255 之间")
	public String getType() {
		return type;
	}
	public String getTypeName() {
		return DictUtils.getDictLabel(type, "alarm_type", "");
	}
	public void setType(String type) {
		if(type.isEmpty()||type.equalsIgnoreCase("alarm")){
			type="1";
		}else{
			type="2";
		}
		this.type = type;
	}



	public String getBuildId() {
		return buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getFloorId() {
		return floorId;
	}

	public void setFloorId(String floorId) {
		this.floorId = floorId;
	}
	@JsonIgnore
	public Building getBuild() {
		return build;
	}

	public void setBuild(Building build) {
		this.build = build;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		if(status.isEmpty()||status.equals("on")){
			status="0";
		}else{
			status="1";
		}
		this.status = status;
	}

	@JsonIgnore
	public BuildingFloor getFloor() {
		return floor;
	}

	public void setFloor(BuildingFloor floor) {
		this.floor = floor;
	}
	
}