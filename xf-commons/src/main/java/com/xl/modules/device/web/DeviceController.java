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
import com.xl.modules.device.entity.Device;
import com.xl.modules.device.service.DeviceService;

/**
 * 消防设施Controller
 * @author dingrenxin
 * @version 2018-03-30
 */
@Controller
@RequestMapping(value = "${adminPath}/device/device")
public class DeviceController extends BaseController {

	@Autowired
	private DeviceService deviceService;
	
	@ModelAttribute
	public Device get(@RequestParam(required=false) String id) {
		Device entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = deviceService.get(id);
		}
		if (entity == null){
			entity = new Device();
		}
		return entity;
	}
	
	@RequiresPermissions("device:device:view")
	@RequestMapping(value = {"list", ""})
	public String list(Device device, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Device> page = deviceService.findPage(new Page<Device>(request, response), device); 
		model.addAttribute("page", page);
		return "modules/device/deviceList";
	}

	@RequiresPermissions("device:device:view")
	@RequestMapping(value = "form")
	public String form(Device device, Model model) {
		model.addAttribute("device", device);
		return "modules/device/deviceForm";
	}

	@RequiresPermissions("device:device:edit")
	@RequestMapping(value = "save")
	public String save(Device device, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, device)){
			return form(device, model);
		}
		deviceService.save(device);
		addMessage(redirectAttributes, "保存消防设施成功");
		return "redirect:"+Global.getAdminPath()+"/device/device/?repage";
	}
	
	@RequiresPermissions("device:device:edit")
	@RequestMapping(value = "delete")
	public String delete(Device device, RedirectAttributes redirectAttributes) {
		deviceService.delete(device);
		addMessage(redirectAttributes, "删除消防设施成功");
		return "redirect:"+Global.getAdminPath()+"/device/device/?repage";
	}

}