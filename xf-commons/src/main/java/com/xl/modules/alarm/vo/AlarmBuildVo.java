package com.xl.modules.alarm.vo;

import java.util.List;

import com.google.common.collect.Lists;

public class AlarmBuildVo {
	private int totalBuild;
	private int alarmBuild;
	private int faltBuild;
	private int normalBuild;
	private List<BuildVo> list=Lists.newArrayList();
	public int getTotalBuild() {
		return totalBuild;
	}
	public void setTotalBuild(int totalBuild) {
		this.totalBuild = totalBuild;
	}
	public int getAlarmBuild() {
		return alarmBuild;
	}
	public void setAlarmBuild(int alarmBuild) {
		this.alarmBuild = alarmBuild;
	}
	public int getFaltBuild() {
		return faltBuild;
	}
	public void setFaltBuild(int faltBuild) {
		this.faltBuild = faltBuild;
	}
	public int getNormalBuild() {
		return normalBuild;
	}
	public void setNormalBuild(int normalBuild) {
		this.normalBuild = normalBuild;
	}
	public List<BuildVo> getList() {
		return list;
	}
	public void setList(List<BuildVo> list) {
		this.list = list;
	}
}
