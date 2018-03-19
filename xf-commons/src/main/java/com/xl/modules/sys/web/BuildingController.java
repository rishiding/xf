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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xl.common.config.Global;
import com.xl.common.persistence.Page;
import com.xl.common.web.BaseController;
import com.xl.common.utils.StringUtils;
import com.xl.modules.sys.entity.Building;
import com.xl.modules.sys.service.BuildingService;

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

}