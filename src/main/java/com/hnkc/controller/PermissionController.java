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

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hnkc.annotation.LogAnnotation;
import com.hnkc.pojo.Permission;
import com.hnkc.service.PermissionService;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class PermissionController {
	@Autowired PermissionService permissionService;
	JSONObject json = new JSONObject();
	
	@GetMapping("/parentPermissions")
	@LogAnnotation(desc = "获取所有的父菜单")
	public List<Permission> list() {
		return permissionService.listParentPermissions();
	}
	
	@GetMapping("/permissions")
	@LogAnnotation(desc = "分页获取所有菜单")
	public PageInfo<Permission> list(@RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "flzj") String flzj) {
		PageHelper.startPage(start, size, "cjsj desc");
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("flzj", flzj);
		if (!StringUtils.isEmpty(keyword)) {
			paramMap.put("keyword", "%" + keyword + "%");
		}
		List<Permission> rs = permissionService.list(paramMap);
		PageInfo<Permission> page = new PageInfo<Permission>(rs, 5);
		return page;
	}
	
	@GetMapping("/permissions/{id}")
	@LogAnnotation(desc = "获取单个菜单")
	public Permission get(@PathVariable("id") String id) {
		Permission permission = permissionService.get(id);
		return permission;
	}
	
	@PostMapping("/permissions")
	@LogAnnotation(desc = "新增菜单")
	public String add(@RequestBody Permission permission) {
		int exist = permissionService.exist(permission);
		if (0 != exist) {
			json.put("code", 1);
			json.put("msg", "菜单名已存在");
		} else {
			permissionService.add(permission);
			json.put("code", 0);
			json.put("msg", "新增成功");
		}
		return json.toJSONString();
	}
	
	@PutMapping("/permissions")
	@LogAnnotation(desc = "修改菜单")
	public String update(@RequestBody Permission permission) {
		permissionService.update(permission);
		return "修改成功";
	}
	
	@DeleteMapping("/permissions/{id}")
	@LogAnnotation(desc = "删除菜单")
	public String delete(@PathVariable("id") String id) {
		permissionService.delete(id);
		return "删除成功";
	}
}
