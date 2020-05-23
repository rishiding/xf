/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.web;

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

import com.xl.common.config.Global;
import com.xl.common.persistence.Page;
import com.xl.common.web.BaseController;
import com.xl.common.utils.StringUtils;
import com.xl.modules.sys.entity.BuildingFloor;
import com.xl.modules.sys.service.BuildingFloorService;

/**
 * 建筑楼层Controller
 * @author rishi
 * @version 2018-03-19
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/buildingFloor")
public class BuildingFloorController extends BaseController {

	@Autowired
	private BuildingFloorService buildingFloorService;
	
	@ModelAttribute
	public BuildingFloor get(@RequestParam(required=false) String id) {
		BuildingFloor entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = buildingFloorService.get(id);
		}
		if (entity == null){
			entity = new BuildingFloor();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:buildingFloor:view")
	@RequestMapping(value = {"list", ""})
	public String list(BuildingFloor buildingFloor, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<BuildingFloor> page = buildingFloorService.findPage(new Page<BuildingFloor>(request, response), buildingFloor); 
		model.addAttribute("page", page);
		return "modules/sys/buildingFloorList";
	}

	@RequiresPermissions("sys:buildingFloor:view")
	@RequestMapping(value = "form")
	public String form(BuildingFloor buildingFloor, Model model) {
		model.addAttribute("buildingFloor", buildingFloor);
		return "modules/sys/buildingFloorForm";
	}
	
	@RequiresPermissions("sys:buildingFloor:view")
	@RequestMapping(value = "deploy")
	public String deploy(BuildingFloor buildingFloor, Model model) {
		model.addAttribute("buildingFloor", buildingFloor);
		return "modules/sys/floorDeploy";
	}

	@RequiresPermissions("sys:buildingFloor:edit")
	@RequestMapping(value = "save")
	public String save(BuildingFloor buildingFloor, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, buildingFloor)){
			return form(buildingFloor, model);
		}
		buildingFloorService.save(buildingFloor);
		addMessage(redirectAttributes, "保存建筑楼层成功");
		return "redirect:"+Global.getAdminPath()+"/sys/buildingFloor/?repage";
	}
	@RequiresPermissions("sys:buildingFloor:edit")
	@RequestMapping(value = "updateMaps")
	@ResponseBody
	public String updateMaps(BuildingFloor buildingFloor, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, buildingFloor)){
			return form(buildingFloor, model);
		}
		buildingFloorService.updateMaps(buildingFloor);
		return "保存成功";
	}
	@RequiresPermissions("sys:buildingFloor:edit")
	@RequestMapping(value = "delete")
	public String delete(BuildingFloor buildingFloor, RedirectAttributes redirectAttributes) {
		buildingFloorService.delete(buildingFloor);
		addMessage(redirectAttributes, "删除建筑楼层成功");
		return "redirect:"+Global.getAdminPath()+"/sys/buildingFloor/?repage";
	}

}