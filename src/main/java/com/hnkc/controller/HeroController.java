package com.hnkc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hnkc.annotation.LogAnnotation;
import com.hnkc.pojo.Hero;
import com.hnkc.service.HeroService;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class HeroController {
	@Autowired HeroService heroService;
	
	@GetMapping("/heros")
	@LogAnnotation(desc = "分页获取所有英雄")
	public PageInfo<Hero> list(@RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		PageHelper.startPage(start, size, "id desc");
		Map<String, String> paramMap = new HashMap<String, String>();
		if (!StringUtils.isEmpty(keyword)) {
			paramMap.put("keyword", keyword);
		}
		List<Hero> hs = heroService.list(paramMap);
		PageInfo<Hero> page = new PageInfo<Hero>(hs, 5);
		return page;
	}
	
	@GetMapping("/heros/{id}")
	@LogAnnotation(desc = "获取单个英雄")
	public Hero get(@PathVariable("id") int id) {
		Hero hero = heroService.get(id);
		return hero;
	}
	
	@PostMapping("/heros")
	@LogAnnotation(desc = "新增英雄")
	public String add(@RequestBody Hero hero) {
		heroService.add(hero);
		return "success";
	}
	
	@PutMapping("/heros")
	@LogAnnotation(desc = "修改英雄")
	public String update(@RequestBody Hero hero) {
		heroService.update(hero);
		return "success";
	}
	
	@DeleteMapping("/heros/{id}")
	@LogAnnotation(desc = "删除英雄")
	public String delete(@PathVariable("id") int id) {
		heroService.delete(id);
		return "success";
	}
}
