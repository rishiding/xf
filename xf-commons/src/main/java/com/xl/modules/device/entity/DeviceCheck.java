/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.device.entity;

import org.hibernate.validator.constraints.Length;

import com.xl.modules.sys.entity.Building;
import com.xl.modules.sys.entity.Office;
import com.xl.modules.sys.utils.DictUtils;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.xl.common.persistence.DataEntity;

/**
 * 消防设施巡检Entity
 * @author dingrenxind
 * @version 2018-03-30
 */
public class DeviceCheck extends DataEntity<DeviceCheck> {
	
	private static final long serialVersionUID = 1L;
	private String sysName;		// 系统名称 : 名称
	private String buildId;		// 所属建筑
	private Building build;
	private Office office;		// 所属消防局机构 : 所属消防局机构
	private Date checkDate;		// 巡检日期
	private String checkBy;		// 巡检人
	private String checkType;		// 巡检类型
	private String normalNum;		// 正常设备数
	private String errorNum;		// 异常设备数量
	private String status;		// 状态 : 0  未上报1 已上报
	
	public DeviceCheck() {
		super();
	}

	public DeviceCheck(String id){
		super(id);
	}

	@Length(min=1, max=100, message="系统名称 : 名称长度必须介于 1 和 100 之间")
	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	
	@Length(min=1, max=64, message="所属建筑长度必须介于 1 和 64 之间")
	public String getBuildId() {
		return buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}
	
	public Building getBuild() {
		return build;
	}

	public void setBuild(Building build) {
		this.build = build;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	
	@Length(min=0, max=64, message="巡检人长度必须介于 0 和 64 之间")
	public String getCheckBy() {
		return checkBy;
	}

	public void setCheckBy(String checkBy) {
		this.checkBy = checkBy;
	}
	public String getCheckTypeName() {
		return DictUtils.getDictLabel(checkType, "check_type", "");
	}
	@Length(min=0, max=64, message="巡检类型长度必须介于 0 和 64 之间")
	public String getCheckType() {
		return checkType;
	}

	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}
	
	@Length(min=0, max=11, message="正常设备数长度必须介于 0 和 11 之间")
	public String getNormalNum() {
		return normalNum;
	}

	public void setNormalNum(String normalNum) {
		this.normalNum = normalNum;
	}
	
	@Length(min=0, max=11, message="异常设备数量长度必须介于 0 和 11 之间")
	public String getErrorNum() {
		return errorNum;
	}

	public void setErrorNum(String errorNum) {
		this.errorNum = errorNum;
	}
	public String getStatusName() {
		return DictUtils.getDictLabel(status, "check_status", "");
	}
	@Length(min=0, max=1, message="状态 : 0  未上报1 已上报长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}