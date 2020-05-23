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
import com.xl.modules.sys.entity.FloorDeploy;
import com.xl.modules.sys.service.FloorDeployService;

/**
 * 楼层部署Controller
 * @author dingrenxin
 * @version 2020-05-23
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/floorDeploy")
public class FloorDeployController extends BaseController {

	@Autowired
	private FloorDeployService floorDeployService;
	
	@ModelAttribute
	public FloorDeploy get(@RequestParam(required=false) String id) {
		FloorDeploy entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = floorDeployService.get(id);
		}
		if (entity == null){
			entity = new FloorDeploy();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:floorDeploy:view")
	@RequestMapping(value = {"list", ""})
	public String list(FloorDeploy floorDeploy, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FloorDeploy> page = floorDeployService.findPage(new Page<FloorDeploy>(request, response), floorDeploy); 
		model.addAttribute("page", page);
		return "modules/sys/floorDeployList";
	}

	@RequiresPermissions("sys:floorDeploy:view")
	@RequestMapping(value = "form")
	public String form(FloorDeploy floorDeploy, Model model) {
		model.addAttribute("floorDeploy", floorDeploy);
		return "modules/sys/floorDeployForm";
	}

	@RequiresPermissions("sys:floorDeploy:edit")
	@RequestMapping(value = "save")
	public String save(FloorDeploy floorDeploy, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, floorDeploy)){
			return form(floorDeploy, model);
		}
		floorDeployService.save(floorDeploy);
		addMessage(redirectAttributes, "保存楼层部署成功");
		return "redirect:"+Global.getAdminPath()+"/sys/floorDeploy/?repage";
	}
	
	@RequiresPermissions("sys:floorDeploy:edit")
	@RequestMapping(value = "delete")
	public String delete(FloorDeploy floorDeploy, RedirectAttributes redirectAttributes) {
		floorDeployService.delete(floorDeploy);
		addMessage(redirectAttributes, "删除楼层部署成功");
		return "redirect:"+Global.getAdminPath()+"/sys/floorDeploy/?repage";
	}

}