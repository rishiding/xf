/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.operation.entity;

import org.hibernate.validator.constraints.Length;

import com.xl.common.persistence.DataEntity;

/**
 * 消防年月检Entity
 * @author dingrenxin
 * @version 2019-06-04
 */
public class Operation extends DataEntity<Operation> {
	
	private static final long serialVersionUID = 1L;
	private String sysType;		// 系统类型
	private String type;		// 检查类型
	private String value;		// 值
	private String ieme;
	
	public Operation() {
		super();
	}

	public Operation(String id){
		super(id);
	}

	@Length(min=0, max=64, message="系统类型长度必须介于 0 和 64 之间")
	public String getSysType() {
		return sysType;
	}

	public void setSysType(String sysType) {
		this.sysType = sysType;
	}
	
	@Length(min=0, max=10, message="检查类型长度必须介于 0 和 10 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=10, message="值长度必须介于 0 和 10 之间")
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getIeme() {
		return ieme;
	}

	public void setIeme(String ieme) {
		this.ieme = ieme;
	}
	
}