package com.xl.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 主页
 * Created by dingrenxin
 * create on 2017/1/11 15:15
 * the email is dingrenxin@jyall.com.
 */
@Controller
public class IndexConteoller {
    @Value("${adminPath:/a}")
    private String adminpath;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "redirect:/www/index.html";
    }
    @RequestMapping(value = "${adminPath}/sys/index")
	public String sysIndex(HttpServletRequest request, HttpServletResponse response, Model model) {	
		
		return "modules/sys/index";
	}
}
