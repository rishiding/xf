/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.device.entity;

import com.xl.modules.sys.entity.Office;
import com.xl.modules.sys.utils.DictUtils;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xl.common.persistence.DataEntity;

/**
 * 消防设施Entity
 * @author dingrenxin
 * @version 2018-03-30
 */
public class Device extends DataEntity<Device> {
	
	private static final long serialVersionUID = 1L;
	private Office office;		// 所属消防局机构 : 所属消防局机构
	private String buildId;		// 消防建筑
	private String deviceId;		// 设施id
	private String deviceName;		// 消防设施名
	private String deviceType;		// 设施类型
	private String note;		// 事件描述
	private String status;		// 状态 : 1 未上报2 已经上报
	private String source;		// 数据来源
	private Date startDate;
	private Date endDate;
	private String queryType;
	
	public Device() {
		super();
	}

	public Device(String id){
		super(id);
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@Length(min=0, max=64, message="消防建筑长度必须介于 0 和 64 之间")
	public String getBuildId() {
		return buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}
	
	@Length(min=0, max=64, message="设施id长度必须介于 0 和 64 之间")
	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	
	@Length(min=0, max=60, message="消防设施名长度必须介于 0 和 60 之间")
	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	
	@Length(min=0, max=10, message="设施类型长度必须介于 0 和 10 之间")
	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}
	
	@Length(min=0, max=1000, message="事件描述长度必须介于 0 和 1000 之间")
	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	public String getStatusName() {
		return DictUtils.getDictLabel(status, "device_status", "");
	}
	@Length(min=0, max=2, message="状态 : 1 未上报2 已经上报长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=10, message="数据来源长度必须介于 0 和 10 之间")
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	@JsonIgnore
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	@JsonIgnore
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@JsonIgnore
	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}
	
}