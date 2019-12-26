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
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index/index");
		return mav;
	}
	
	@GetMapping("/")
	public ModelAndView index1() {
		ModelAndView mav = new ModelAndView("index/index");
		return mav;
	}
	
	@GetMapping("/listCategory")
	public ModelAndView listCategory() {
		ModelAndView mav = new ModelAndView("category/listCategory");
		return mav;
	}
	
	@GetMapping("/listUser")
	public ModelAndView listUser() {
		ModelAndView mav = new ModelAndView("user/listUser");
		return mav;
	}
	
	@GetMapping("/listRole")
	public ModelAndView listRole() {
		ModelAndView mav = new ModelAndView("role/listRole");
		return mav;
	}
	
	@GetMapping("/listPermission")
	public ModelAndView listPermission() {
		ModelAndView mav = new ModelAndView("permission/listPermission");
		return mav;
	}
	
	@GetMapping("/listHotel")
	public ModelAndView listHotel() {
		ModelAndView mav = new ModelAndView("hotel/listHotel");
		return mav;
	}

	@GetMapping("/listSp")
	public ModelAndView listSp() {
		ModelAndView mav = new ModelAndView("sp/listSp");
		return mav;
	}
	
	@GetMapping("/listWb")
	public ModelAndView listWb() {
		ModelAndView mav = new ModelAndView("wb/listWb");
		return mav;
	}
	
	@GetMapping("/listYy")
	public ModelAndView listYy() {
		ModelAndView mav = new ModelAndView("yy/listYy");
		return mav;
	}
	
	@GetMapping("/listJyz")
	public ModelAndView listJyz() {
		ModelAndView mav = new ModelAndView("jyz/listJyz");
		return mav;
	}
	
	@GetMapping("/listKk")
	public ModelAndView listKk() {
		ModelAndView mav = new ModelAndView("kk/listKk");
		return mav;
	}
	
	@GetMapping("/listLd")
	public ModelAndView listLd() {
		ModelAndView mav = new ModelAndView("ld/listLd");
		return mav;
	}
	
	@GetMapping("/listHero")
	public ModelAndView listHero() {
		ModelAndView mav = new ModelAndView("hero/listHero");
		return mav;
	}
	
	@GetMapping("/listSystemLog")
	public ModelAndView listSystemLog() {
		ModelAndView mav = new ModelAndView("systemLog/listSystemLog");
		return mav;
	}
	
}
