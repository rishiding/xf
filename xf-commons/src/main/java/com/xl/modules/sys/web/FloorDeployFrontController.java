/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.sys.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xl.common.web.BaseController;
import com.xl.common.utils.StringUtils;
import com.xl.modules.sys.entity.BuildingFloor;
import com.xl.modules.sys.service.BuildingFloorService;

/**
 * 楼层部署Controller
 * @author dingrenxin
 * @version 2020-05-23
 */
@Controller
@RequestMapping(value = "${frontPath}/floor")
public class FloorDeployFrontController extends BaseController {

	
	
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
	
	@RequestMapping(value = "deploy")
	public String deploy(BuildingFloor buildingFloor, Model model) {
		model.addAttribute("buildingFloor", buildingFloor);
		return "modules/sys/frontDeploy";
	}
}