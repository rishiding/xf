/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.xl.common.web.BaseController;
import com.xl.modules.sys.entity.Building;
import com.xl.modules.sys.service.BuildingService;

/**
 * 消防建筑Controller
 * @author rishi
 * @version 2018-03-19
 */
@Controller
@RequestMapping(value = "${frontPath}/sys/building")
public class BuildingFrontController extends BaseController {

	@Autowired
	private BuildingService buildingService;	
	
	
	
	@RequestMapping(value = "detail")
	public String detail(String id, Model model) {
		Building building=buildingService.get(id);
		model.addAttribute("building", building);
		return "modules/sys/buildingDetail";
	}
	@RequestMapping(value = "navigation")
	public String navigation(String id, Model model) {
		Building building=buildingService.get(id);
		model.addAttribute("building", building);
		return "modules/sys/buildingNavigation";
	}


}