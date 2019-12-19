package com.hnkc.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.hnkc.pojo.Role;
import com.hnkc.service.PermissionService;
import com.hnkc.service.RoleService;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class RoleController {
	@Autowired RoleService roleService;
	@Autowired PermissionService permissionService;
	JSONObject json = new JSONObject();
	
	@GetMapping("/roles")
	@LogAnnotation(desc = "分页获取所有角色")
	public PageInfo<Role> list(@RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		PageHelper.startPage(start, size, "cjsj desc");
		Map<String, String> paramMap = new HashMap<String, String>();
		if (!StringUtils.isEmpty(keyword)) {
			paramMap.put("keyword", "%" + keyword + "%");
		}
		List<Role> rs = roleService.list(paramMap);
		PageInfo<Role> page = new PageInfo<Role>(rs, 5);
		return page;
	}
	
	@GetMapping("/roles/{id}")
	@LogAnnotation(desc = "获取单个角色")
	public String get(@PathVariable("id") String id) {
		Role role = roleService.get(id);
		List<Permission> permissions = permissionService.list(null);
		json.put("role", role);
		json.put("permissions", permissions);
		return json.toJSONString();
	}
	
	@GetMapping("/listPermissions")
	public List<Permission> get() {
		List<Permission> permissions = permissionService.listPermissions();
		return permissions;
	}
	
	@PostMapping("/rolesBatch")
	@LogAnnotation(desc = "批量分配角色权限")
	public String addBatch(@RequestBody JSONObject params) {
		String[] roleStrs = params.get("roleIds").toString().split(",");
		Set<String> roleIds = new HashSet<String>();
		for (String roleStr : roleStrs) {
			roleIds.add(roleStr);
		}
		String[] permissionStrs = params.get("permissionIds").toString().split(",");
		Set<String> permissionIds = new HashSet<String>();
		for (String permissionStr : permissionStrs) {
			permissionIds.add(permissionStr);
		}
		roleService.updateBatch(roleIds, permissionIds);
		return "分配成功";
	}
	
	@PostMapping("/roles")
	@LogAnnotation(desc = "新增角色")
	public String add(@RequestBody Role role) {
		int exist = roleService.exist(role);
		if (0 != exist) {
			json.put("code", 1);
			json.put("msg", "角色名已存在");
		} else {
			roleService.add(role);
			json.put("code", 0);
			json.put("msg", "新增成功");
		}
		return json.toJSONString();
	}
	
	@PutMapping("/roles")
	@LogAnnotation(desc = "修改角色")
	public String update(@RequestBody Role role) {
		roleService.update(role);
		return "修改成功";
	}
	
	@DeleteMapping("/roles/{id}")
	@LogAnnotation(desc = "删除角色")
	public String delete(@PathVariable("id") String id) {
		roleService.delete(id);
		return "删除成功";
	}
}
