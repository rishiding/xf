/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.xl.common.config.Global;
import com.xl.common.persistence.Page;
import com.xl.common.web.BaseController;
import com.xl.common.utils.StringUtils;
import com.xl.modules.alarm.vo.AlarmBuildVo;
import com.xl.modules.sys.entity.Building;
import com.xl.modules.sys.service.BuildingService;
import com.xl.modules.sys.utils.UserUtils;

/**
 * 消防建筑Controller
 * @author rishi
 * @version 2018-03-19
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/building")
public class BuildingController extends BaseController {

	@Autowired
	private BuildingService buildingService;
	
	@ModelAttribute
	public Building get(@RequestParam(required=false) String id) {
		Building entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = buildingService.get(id);
		}
		if (entity == null){
			entity = new Building();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:building:view")
	@RequestMapping(value = {"list", ""})
	public String list(Building building, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Building> page = buildingService.findPage(new Page<Building>(request, response), building); 
		model.addAttribute("page", page);
		return "modules/sys/buildingList";
	}

	@RequiresPermissions("sys:building:view")
	@RequestMapping(value = "form")
	public String form(Building building, Model model) {
		model.addAttribute("building", building);
		return "modules/sys/buildingForm";
	}

	@RequiresPermissions("sys:building:edit")
	@RequestMapping(value = "save")
	public String save(Building building, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, building)){
			return form(building, model);
		}
		if(StringUtils.isNotBlank(building.getPoint())){
			String[] a=building.getPoint().split(",");
			building.setLongitude(a[0]);
			building.setLatitude(a[1]);
		}
		buildingService.save(building);
		addMessage(redirectAttributes, "保存消防建筑成功");
		return "redirect:"+Global.getAdminPath()+"/sys/building/?repage";
	}
	
	@RequiresPermissions("sys:building:edit")
	@RequestMapping(value = "delete")
	public String delete(Building building, RedirectAttributes redirectAttributes) {
		buildingService.delete(building);
		addMessage(redirectAttributes, "删除消防建筑成功");
		return "redirect:"+Global.getAdminPath()+"/sys/building/?repage";
	}
	
	//UserUtils.getAreaList();
	
	/**
	 * 获取机构JSON数据。
	 * @param extId 排除的ID
	 * @param type	类型（1：公司；2：部门/小组/其它：3：用户）
	 * @param grade 显示级别
	 * @param response
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "alarmData")
	public Object alarmData(Building entity, HttpServletResponse response) {
		AlarmBuildVo vo = buildingService.findAlarmBuild(entity);
		return vo;
	}
	
	/**
	 * 获取机构JSON数据。
	 * @param extId 排除的ID
	 * @param type	类型（1：公司；2：部门/小组/其它：3：用户）
	 * @param grade 显示级别
	 * @param response
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(Building entity, @RequestParam(required=false) String extId,HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Building> list = buildingService.findList(entity);
		for (int i=0; i<list.size(); i++){
			Building e = list.get(i);
			if ((StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) ))){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", "0");				
				map.put("name", e.getName());
				
				mapList.add(map);
			}
			
		}
		return mapList;
	}


}