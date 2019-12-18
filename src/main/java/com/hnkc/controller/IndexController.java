package com.hnkc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hnkc.annotation.LogAnnotation;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@Controller
public class IndexController {
	@GetMapping("/login")
	@LogAnnotation(desc = "跳转至登录页面")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login/login2");
		return mav;
	}
	
	@GetMapping("/demo")
	public ModelAndView demo() {
		ModelAndView mav = new ModelAndView("demo");
		return mav;
	}
	
	@GetMapping("/demo2")
	public ModelAndView demo2() {
		ModelAndView mav = new ModelAndView("demo2");
		return mav;
	}
	
	@GetMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home/home");
		return mav;
	}
	
	@GetMapping("/index")
	@LogAnnotation(desc = "跳转至首页")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index/index");
		return mav;
	}
	
	@GetMapping("/listCategory")
	@LogAnnotation(desc = "跳转至分类管理页面")
	public ModelAndView listCategory() {
		ModelAndView mav = new ModelAndView("category/listCategory");
		return mav;
	}
	
	@GetMapping("/listUser")
	@LogAnnotation(desc = "跳转至用户管理页面")
	public ModelAndView listUser() {
		ModelAndView mav = new ModelAndView("user/listUser");
		return mav;
	}
	
	@GetMapping("/listRole")
	@LogAnnotation(desc = "跳转至角色管理页面")
	public ModelAndView listRole() {
		ModelAndView mav = new ModelAndView("role/listRole");
		return mav;
	}
	
	@GetMapping("/listPermission")
	@LogAnnotation(desc = "跳转至菜单管理页面")
	public ModelAndView listPermission() {
		ModelAndView mav = new ModelAndView("permission/listPermission");
		return mav;
	}
	
	@GetMapping("/listHotel")
	@LogAnnotation(desc = "跳转至旅馆管理页面")
	public ModelAndView listHotel() {
		ModelAndView mav = new ModelAndView("hotel/listHotel");
		return mav;
	}

	@GetMapping("/listSp")
	@LogAnnotation(desc = "跳转至视频管理页面")
	public ModelAndView listSp() {
		ModelAndView mav = new ModelAndView("sp/listSp");
		return mav;
	}
	
	@GetMapping("/listWb")
	@LogAnnotation(desc = "跳转至网吧管理页面")
	public ModelAndView listWb() {
		ModelAndView mav = new ModelAndView("wb/listWb");
		return mav;
	}
	
	@GetMapping("/listYy")
	@LogAnnotation(desc = "跳转至医院管理页面")
	public ModelAndView listYy() {
		ModelAndView mav = new ModelAndView("yy/listYy");
		return mav;
	}
	
	@GetMapping("/listJyz")
	@LogAnnotation(desc = "跳转至加油站管理页面")
	public ModelAndView listJyz() {
		ModelAndView mav = new ModelAndView("jyz/listJyz");
		return mav;
	}
	
	@GetMapping("/listKk")
	@LogAnnotation(desc = "跳转至卡口管理页面")
	public ModelAndView listKk() {
		ModelAndView mav = new ModelAndView("kk/listKk");
		return mav;
	}
	
	@GetMapping("/listLd")
	@LogAnnotation(desc = "跳转至旅店管理页面")
	public ModelAndView listLd() {
		ModelAndView mav = new ModelAndView("ld/listLd");
		return mav;
	}
	
	@GetMapping("/listHero")
	@LogAnnotation(desc = "跳转至英雄管理页面")
	public ModelAndView listHero() {
		ModelAndView mav = new ModelAndView("hero/listHero");
		return mav;
	}
	
	@GetMapping("/listSystemLog")
	@LogAnnotation(desc = "跳转至日志管理页面")
	public ModelAndView listSystemLog() {
		ModelAndView mav = new ModelAndView("systemLog/listSystemLog");
		return mav;
	}
	
}
