/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.web;

import java.util.List;
import java.util.Map;

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
import com.xl.common.web.BaseController;
import com.xl.common.utils.StringUtils;
import com.xl.modules.sys.entity.Unit;
import com.xl.modules.sys.entity.User;
import com.xl.modules.sys.service.UnitService;
import com.xl.modules.sys.utils.UserUtils;

/**
 * 单位管理Controller
 * @author rishi
 * @version 2017-11-16
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/unit")
public class UnitController extends BaseController {

	@Autowired
	private UnitService unitService;
	
	@ModelAttribute("unit")
	public Unit get(@RequestParam(required=false) String id) {
		Unit entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = unitService.get(id);
		}
		if (entity == null){
			entity = new Unit();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:unit:view")
	@RequestMapping(value = {""})
	public String index(Unit office, Model model) {
		return "modules/sys/unitIndex";
	}
	
	@RequiresPermissions("sys:unit:view")
	@RequestMapping(value = {"list"})
	public String list(Unit unit, Model model) {
		model.addAttribute("list", unitService.findList(unit));
		return "modules/sys/unitList";
	}

	@RequiresPermissions("sys:unit:view")
	@RequestMapping(value = "form")
	public String form(Unit unit, Model model) {
		User user = UserUtils.getUser();
		if(unit.getParent()!=null){
			
			Unit tunit=unitService.get(unit.getParent().getId());
			if(tunit!=null){
				unit.setParent(tunit);
				unit.setOffice(tunit.getOffice());
			}
		}
		if (unit.getArea()==null){
			unit.setArea(user.getOffice().getArea());
		}
		// 自动获取排序号
		if (StringUtils.isBlank(unit.getId())&&unit.getParent()!=null){
			int size = 0;
			List<Unit> list = unitService.findAll();
			for (int i=0; i<list.size(); i++){
				Unit e = list.get(i);
				if (e.getParent()!=null && e.getParent().getId()!=null
						&& e.getParent().getId().equals(unit.getParent().getId())){
					size++;
				}
			}
			unit.setCode(unit.getParent().getCode() + StringUtils.leftPad(String.valueOf(size > 0 ? size+1 : 1), 3, "0"));
		}
		
		model.addAttribute("unit", unit);
		return "modules/sys/unitForm";
	}

	@RequiresPermissions("sys:unit:edit")
	@RequestMapping(value = "save")
	public String save(Unit unit, Model model, RedirectAttributes redirectAttributes) {
		
		
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/sys/unit/";
		}
		if (!beanValidator(model, unit)){
			return form(unit, model);
		}
		unitService.save(unit);	
		
		
		addMessage(redirectAttributes, "保存单位'" + unit.getName() + "'成功");
		String id = "0".equals(unit.getParentId()) ? "" : unit.getParentId();
		return "redirect:" + adminPath + "/sys/unit/list?id="+id+"&parentIds="+unit.getParentIds();
		
	}
	
	@RequiresPermissions("sys:unit:edit")
	@RequestMapping(value = "delete")
	public String delete(Unit unit, RedirectAttributes redirectAttributes) {
		
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + Global.getAdminPath() + "/sys/unit/list";
		}

		unitService.delete(unit);
		addMessage(redirectAttributes, "删除单位成功");
		return "redirect:" + Global.getAdminPath() + "/sys/unit/list?id="+unit.getParentId()+"&parentIds="+unit.getParentIds();
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
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, @RequestParam(required=false) String type,
			@RequestParam(required=false) Long grade, @RequestParam(required=false) Boolean isAll, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Unit> list = unitService.findList(isAll);
		for (int i=0; i<list.size(); i++){
			Unit e = list.get(i);
			if ((StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1))
					&& Global.YES.equals(e.getUsable())){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				if (type != null && "3".equals(type)){
					map.put("isParent", true);
				}
				mapList.add(map);
			}
		}
		return mapList;
	}

}