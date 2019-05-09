/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.terminal.web;

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
import com.xl.modules.terminal.entity.Terminal;
import com.xl.modules.terminal.service.TerminalService;

/**
 * 消防终端Controller
 * @author dingrenxin
 * @version 2019-04-24
 */
@Controller
@RequestMapping(value = "${adminPath}/terminal")
public class TerminalController extends BaseController {

	@Autowired
	private TerminalService terminalService;
	
	@ModelAttribute
	public Terminal get(@RequestParam(required=false) String id) {
		Terminal entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = terminalService.get(new Terminal(id));
		}
		if (entity == null){
			entity = new Terminal();
		}
		return entity;
	}
	
	@RequiresPermissions("terminal:terminal:view")
	@RequestMapping(value = {"list", ""})
	public String list(Terminal terminal, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Terminal> page = terminalService.findPage(new Page<Terminal>(request, response), terminal); 
		model.addAttribute("page", page);
		return "modules/terminal/terminalList";
	}

	@RequiresPermissions("terminal:terminal:view")
	@RequestMapping(value = "form")
	public String form(Terminal terminal, Model model) {
		model.addAttribute("terminal", terminal);
		return "modules/terminal/terminalForm";
	}

	@RequiresPermissions("terminal:terminal:edit")
	@RequestMapping(value = "save")
	public String save(Terminal terminal, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, terminal)){
			return form(terminal, model);
		}
		terminalService.save(terminal);
		addMessage(redirectAttributes, "保存消防终端成功");
		return "redirect:"+Global.getAdminPath()+"/terminal/terminal/?repage";
	}
	
	@RequiresPermissions("terminal:terminal:edit")
	@RequestMapping(value = "delete")
	public String delete(Terminal terminal, RedirectAttributes redirectAttributes) {
		terminalService.delete(terminal);
		addMessage(redirectAttributes, "删除消防终端成功");
		return "redirect:"+Global.getAdminPath()+"/terminal/terminal/?repage";
	}

}