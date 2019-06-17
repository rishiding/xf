/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.alarm.web;

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
import com.xl.modules.alarm.entity.Alarm;
import com.xl.modules.alarm.service.AlarmService;
import com.xl.modules.sys.service.BuildingService;

/**
 * 报警记录Controller
 * @author dingrenxin
 * @version 2019-06-04
 */
@Controller
@RequestMapping(value = "${adminPath}/alarm/alarm")
public class AlarmController extends BaseController {

	@Autowired
	private AlarmService alarmService;	
	
	
	@ModelAttribute
	public Alarm get(@RequestParam(required=false) String id) {
		Alarm entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = alarmService.get(id);
		}
		if (entity == null){
			entity = new Alarm();
		}
		return entity;
	}
	@RequiresPermissions("user")
	@RequestMapping(value = {"index"})
	public String index(Alarm alarm, HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/alarm/alarmIndex";
	}
	
	
	
	@RequiresPermissions("alarm:alarm:view")
	@RequestMapping(value = {"list", ""})
	public String list(Alarm alarm, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Alarm> page = alarmService.findPage(new Page<Alarm>(request, response), alarm); 
		model.addAttribute("page", page);
		return "modules/alarm/alarmList";
	}

	@RequiresPermissions("alarm:alarm:view")
	@RequestMapping(value = "form")
	public String form(Alarm alarm, Model model) {
		model.addAttribute("alarm", alarm);
		return "modules/alarm/alarmForm";
	}

	@RequiresPermissions("alarm:alarm:edit")
	@RequestMapping(value = "save")
	public String save(Alarm alarm, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, alarm)){
			return form(alarm, model);
		}
		alarmService.save(alarm);
		addMessage(redirectAttributes, "保存报警记录成功");
		return "redirect:"+Global.getAdminPath()+"/alarm/alarm/?repage";
	}
	
	@RequiresPermissions("alarm:alarm:edit")
	@RequestMapping(value = "delete")
	public String delete(Alarm alarm, RedirectAttributes redirectAttributes) {
		alarmService.delete(alarm);
		addMessage(redirectAttributes, "删除报警记录成功");
		return "redirect:"+Global.getAdminPath()+"/alarm/alarm/?repage";
	}

}