/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.terminal.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.xl.common.persistence.DataEntity;

/**
 * 消防终端Entity
 * @author dingrenxin
 * @version 2019-04-24
 */
public class Terminal extends DataEntity<Terminal> {
	
	private static final long serialVersionUID = 1L;
	private String ieme;		// 设备标识
	private String ccid;		// 该值用于查询电话卡的卡号用于用户的充值
	private String longitude;		// 经度
	private String latitude;		// 纬度
	private String name;		// 设备类型
	private String online;		// 是否在线 :
	private Date lastOnlineTime;		// 最后一次在线时间
	
	public Terminal() {
		super();
	}

	public Terminal(String id){
		super(id);
	}

	@Length(min=1, max=64, message="设备标识长度必须介于 1 和 64 之间")
	public String getIeme() {
		return ieme;
	}

	public void setIeme(String ieme) {
		this.ieme = ieme;
	}
	
	@Length(min=0, max=64, message="该值用于查询电话卡的卡号用于用户的充值长度必须介于 0 和 64 之间")
	public String getCcid() {
		return ccid;
	}

	public void setCcid(String ccid) {
		this.ccid = ccid;
	}
	
	@Length(min=0, max=50, message="经度长度必须介于 0 和 50 之间")
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	@Length(min=0, max=50, message="纬度长度必须介于 0 和 50 之间")
	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	
	@Length(min=0, max=255, message="设备类型长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1, message="是否在线 :长度必须介于 0 和 1 之间")
	public String getOnline() {
		return online;
	}

	public void setOnline(String online) {
		this.online = online;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="最后一次在线时间不能为空")
	public Date getLastOnlineTime() {
		return lastOnlineTime;
	}

	public void setLastOnlineTime(Date lastOnlineTime) {
		this.lastOnlineTime = lastOnlineTime;
	}
	
}