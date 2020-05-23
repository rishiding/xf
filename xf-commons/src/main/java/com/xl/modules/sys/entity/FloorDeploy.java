/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.xl.common.persistence.DataEntity;

/**
 * 楼层部署Entity
 * @author dingrenxin
 * @version 2020-05-23
 */
public class FloorDeploy extends DataEntity<FloorDeploy> {
	
	private static final long serialVersionUID = 1L;
	private String floorId;		// 楼层
	private String loopNumber;		// loop_number
	private String name;
	private String point;
	
	public FloorDeploy() {
		super();
	}

	public FloorDeploy(String id){
		super(id);
	}

	@Length(min=1, max=64, message="楼层长度必须介于 1 和 64 之间")
	public String getFloorId() {
		return floorId;
	}

	public void setFloorId(String floorId) {
		this.floorId = floorId;
	}
	
	@Length(min=0, max=64, message="loop_number长度必须介于 0 和 64 之间")
	public String getLoopNumber() {
		return loopNumber;
	}

	public void setLoopNumber(String loopNumber) {
		this.loopNumber = loopNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}
	
}