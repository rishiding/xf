/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.alarm.entity;

import org.hibernate.validator.constraints.Length;

import com.xl.common.persistence.DataEntity;

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

	public void setSysType(String sysType) {
		this.sysType = sysType;
	}
	
	@Length(min=0, max=255, message="报警类型长度必须介于 0 和 255 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}