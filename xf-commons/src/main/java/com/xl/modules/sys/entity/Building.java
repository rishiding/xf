/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xl.common.persistence.DataEntity;
import com.xl.modules.alarm.vo.BuildVo;

/**
 * 消防建筑Entity
 * @author rishi
 * @version 2018-03-19
 */
public class Building extends DataEntity<Building> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 建筑名
	private Unit unit;		// 编号
	private String buildingNo;		// 楼栋
	private String latitude;		// 纬度
	private String longitude;		// 经度
	private String point;		// 经纬度
	private String floorNum;		// 楼层数量
	private String planeImg;		// 平面图
	private String elevatorsNum;		// 电梯数量
	private String stairNum;		// 楼梯数量
	private String videoUrl;		// 视频监控地址
	private String ieme;	//设备号
	private String address;  
	private String status;
	private Date alarmDate;
	private Date querydate;
	private String areaId;
	
	public Building() {
		super();
	}

	public Building(String id){
		super(id);
	}

	@Length(min=0, max=255, message="建筑名长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}
	
	@Length(min=0, max=64, message="楼栋长度必须介于 0 和 64 之间")
	public String getBuildingNo() {
		return buildingNo;
	}

	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}
	
	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	@Length(min=0, max=100, message="经纬度长度必须介于 0 和 100 之间")
	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}
	
	@Length(min=0, max=11, message="楼层数量长度必须介于 0 和 11 之间")
	public String getFloorNum() {
		return floorNum;
	}

	public void setFloorNum(String floorNum) {
		this.floorNum = floorNum;
	}
	
	@Length(min=0, max=400, message="平面图长度必须介于 0 和 400 之间")
	public String getPlaneImg() {
		return planeImg;
	}

	public void setPlaneImg(String planeImg) {
		this.planeImg = planeImg;
	}
	
	@Length(min=0, max=11, message="电梯数量长度必须介于 0 和 11 之间")
	public String getElevatorsNum() {
		return elevatorsNum;
	}

	public void setElevatorsNum(String elevatorsNum) {
		this.elevatorsNum = elevatorsNum;
	}
	
	@Length(min=0, max=11, message="楼梯数量长度必须介于 0 和 11 之间")
	public String getStairNum() {
		return stairNum;
	}

	public void setStairNum(String stairNum) {
		this.stairNum = stairNum;
	}
	
	@Length(min=0, max=5000, message="视频监控地址长度必须介于 0 和 5000 之间")
	public String getVideoUrl() {
		return videoUrl;
	}

	public String getIeme() {
		return ieme;
	}

	public void setIeme(String ieme) {
		this.ieme = ieme;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAlarmDate() {
		return alarmDate;
	}

	public void setAlarmDate(Date alarmDate) {
		this.alarmDate = alarmDate;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	@JsonIgnore
	public Date getQuerydate() {
		return querydate;
	}

	public void setQuerydate(Date querydate) {
		this.querydate = querydate;
	}
	@JsonIgnore
	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	@JsonIgnore
	public BuildVo toBuildVo(){
		BuildVo vo=new BuildVo();
		vo.setId(this.id);
		vo.setContent(this.address);
		vo.setTitle(this.name);
		vo.setStatus(this.status);
		vo.setPoint(this.longitude+"|"+this.latitude);
		vo.setIcon("/static/images/status/normal1.png");
		if(this.getStatus()!=null){
			if(this.getStatus().equals("1")){
				vo.setIcon("/static/images/status/fire.png");
			}else if(this.getStatus().equals("2")){
				vo.setIcon("/static/images/status/alarm.png");
			}
		}
		vo.setIsOpen("0");
		return vo;
	}
	
}