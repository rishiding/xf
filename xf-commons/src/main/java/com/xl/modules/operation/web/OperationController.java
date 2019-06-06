/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.operation.web;

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
import com.xl.modules.operation.entity.Operation;
import com.xl.modules.operation.service.OperationService;

/**
 * 消防年月检Controller
 * @author dingrenxin
 * @version 2019-06-04
 */
@Controller
@RequestMapping(value = "${adminPath}/operation/operation")
public class OperationController extends BaseController {

	@Autowired
	private OperationService operationService;
	
	@ModelAttribute
	public Operation get(@RequestParam(required=false) String id) {
		Operation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = operationService.get(id);
		}
		if (entity == null){
			entity = new Operation();
		}
		return entity;
	}
	
	@RequiresPermissions("operation:operation:view")
	@RequestMapping(value = {"list", ""})
	public String list(Operation operation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Operation> page = operationService.findPage(new Page<Operation>(request, response), operation); 
		model.addAttribute("page", page);
		return "modules/operation/operationList";
	}

	@RequiresPermissions("operation:operation:view")
	@RequestMapping(value = "form")
	public String form(Operation operation, Model model) {
		model.addAttribute("operation", operation);
		return "modules/operation/operationForm";
	}

	@RequiresPermissions("operation:operation:edit")
	@RequestMapping(value = "save")
	public String save(Operation operation, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, operation)){
			return form(operation, model);
		}
		operationService.save(operation);
		addMessage(redirectAttributes, "保存消防年月检成功");
		return "redirect:"+Global.getAdminPath()+"/operation/operation/?repage";
	}
	
	@RequiresPermissions("operation:operation:edit")
	@RequestMapping(value = "delete")
	public String delete(Operation operation, RedirectAttributes redirectAttributes) {
		operationService.delete(operation);
		addMessage(redirectAttributes, "删除消防年月检成功");
		return "redirect:"+Global.getAdminPath()+"/operation/operation/?repage";
	}

}