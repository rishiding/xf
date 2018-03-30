/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.device.web;

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
import com.xl.modules.device.entity.DeviceCheck;
import com.xl.modules.device.service.DeviceCheckService;

/**
 * 消防设施巡检Controller
 * @author dingrenxind
 * @version 2018-03-30
 */
@Controller
@RequestMapping(value = "${adminPath}/device/deviceCheck")
public class DeviceCheckController extends BaseController {

	@Autowired
	private DeviceCheckService deviceCheckService;
	
	@ModelAttribute
	public DeviceCheck get(@RequestParam(required=false) String id) {
		DeviceCheck entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = deviceCheckService.get(id);
		}
		if (entity == null){
			entity = new DeviceCheck();
		}
		return entity;
	}
	
	@RequiresPermissions("device:deviceCheck:view")
	@RequestMapping(value = {"list", ""})
	public String list(DeviceCheck deviceCheck, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DeviceCheck> page = deviceCheckService.findPage(new Page<DeviceCheck>(request, response), deviceCheck); 
		model.addAttribute("page", page);
		return "modules/device/deviceCheckList";
	}

	@RequiresPermissions("device:deviceCheck:view")
	@RequestMapping(value = "form")
	public String form(DeviceCheck deviceCheck, Model model) {
		model.addAttribute("deviceCheck", deviceCheck);
		return "modules/device/deviceCheckForm";
	}

	@RequiresPermissions("device:deviceCheck:edit")
	@RequestMapping(value = "save")
	public String save(DeviceCheck deviceCheck, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, deviceCheck)){
			return form(deviceCheck, model);
		}
		deviceCheckService.save(deviceCheck);
		addMessage(redirectAttributes, "保存消防设施巡检成功");
		return "redirect:"+Global.getAdminPath()+"/device/deviceCheck/?repage";
	}
	
	@RequiresPermissions("device:deviceCheck:edit")
	@RequestMapping(value = "delete")
	public String delete(DeviceCheck deviceCheck, RedirectAttributes redirectAttributes) {
		deviceCheckService.delete(deviceCheck);
		addMessage(redirectAttributes, "删除消防设施巡检成功");
		return "redirect:"+Global.getAdminPath()+"/device/deviceCheck/?repage";
	}

}