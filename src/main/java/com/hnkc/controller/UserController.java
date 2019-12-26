package com.hnkc.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

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
import com.hnkc.pojo.PcsTree;
import com.hnkc.pojo.Role;
import com.hnkc.pojo.User;
import com.hnkc.service.RoleService;
import com.hnkc.service.UserService;
import com.hnkc.util.MD5;
import com.hnkc.util.StringUtil;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class UserController {
	@Autowired UserService userService;
	@Autowired RoleService roleService;
	
	@GetMapping("/listPcsTree")
	public String listPcsTree() {
		List<PcsTree> list = userService.listPcsTree();
		JSONObject json = new JSONObject();
		json.put("code", 0);
		json.put("msg", "获取成功");
		json.put("data", list);
		return json.toJSONString();
	}
	
	@PostMapping("/login")
	@LogAnnotation(funs="用户管理",name="登录",type="query")
	public String login(@RequestBody User user, HttpSession session) throws NoSuchAlgorithmException {
		user.setYhmm(MD5.md5(user.getYhmm()));
		User loginUser = userService.login(user);
		JSONObject json = new JSONObject();
		if (null == loginUser) {
			json.put("code", 1);
		} else {
			session.setAttribute("user", loginUser);
			json.put("user", loginUser);
			json.put("code", 0);
		}
		return json.toJSONString();
	}
	
	@GetMapping("/logout")
	@LogAnnotation(funs="用户管理",name="注销",type="query")
	public void logout(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (null != user) {
			session.removeAttribute("user");
		}
	}
	
	@GetMapping("/users")
	@LogAnnotation(funs="用户管理页面",name="分页获取用户数据",type="query")
	public PageInfo<User> list(@RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "zzjgdm", defaultValue = "") String zzjgdm) {
		PageHelper.startPage(start, size, "cjsj desc");
		Map<String, String> paramMap = new HashMap<String, String>();
		if (!StringUtils.isEmpty(keyword)) {
			paramMap.put("keyword", "%" + keyword + "%");
		}
		if (!StringUtils.isEmpty(zzjgdm)) {
			paramMap.put("zzjgdm", zzjgdm);
		}
		List<User> us = userService.list(paramMap);
		PageInfo<User> page = new PageInfo<User>(us, 5);
		return page;
	}
	
	@GetMapping("/users/{id}")
	@LogAnnotation(funs="用户管理页面",name="根据编号获取用户数据",type="query")
	public String get(@PathVariable("id") String id) {
		User user = userService.get(id);
		List<Role> roles = roleService.list(null);
		JSONObject json = new JSONObject();
		json.put("user", user);
		json.put("roles", roles);
		return json.toJSONString();
	}
	
	@GetMapping("/listRoles")
	public List<Role> get() {
		List<Role> roles = roleService.list(null);
		return roles;
	}
	
	@PostMapping("/usersBatch")
	@LogAnnotation(funs="用户管理页面",name="为用户批量分配角色",type="update")
	public String addBatch(@RequestBody JSONObject params) {
		String[] userStrs = params.get("userIds").toString().split(",");
		Set<String> userIds = new HashSet<String>();
		for (String userStr : userStrs) {
			userIds.add(userStr);
		}
		String[] roleStrs = params.get("roleIds").toString().split(",");
		Set<String> roleIds = new HashSet<String>();
		for (String roleStr : roleStrs) {
			roleIds.add(roleStr);
		}
		userService.updateBatch(userIds, roleIds);
		return "分配成功";
	}
	
	@PostMapping("/dljgBatch")
	@LogAnnotation(funs="用户管理页面",name="为用户批量分配代理机构",type="update")
	public String dljgBatch(@RequestBody JSONObject params) {
		String[] userStrs = params.get("userIds").toString().split(",");
		Set<String> userIds = new HashSet<String>();
		for (String userStr : userStrs) {
			userIds.add(userStr);
		}
		String dljgId = params.getString("dljgId");
		String dljgName = params.getString("dljgName");
		userService.updateBatchDljg(userIds, dljgId, dljgName);
		return "分配成功";
	}
	
	@PostMapping("/users")
	@LogAnnotation(funs="用户管理页面",name="新增用户",type="insert")
	public String add(@RequestBody User user) throws NoSuchAlgorithmException {
		int exist = userService.exist(user);
		JSONObject json = new JSONObject();
		if (0 != exist) {
			json.put("code", 1);
			json.put("msg", "用户名已存在");
		} else {
			user.setId(StringUtil.getGUID());
			user.setQydm(user.getZzjgdm().substring(0, 4));
			userService.add(user);
			json.put("code", 0);
			json.put("msg", "新增成功");
		}
		return json.toJSONString();
	}
	
	@PutMapping("/users")
	@LogAnnotation(funs="用户管理页面",name="修改用户数据",type="update")
	public String update(@RequestBody User user) throws NoSuchAlgorithmException {
		user.setQydm(user.getZzjgdm().substring(0, 4));
		userService.update(user);
		return "修改成功";
	}
	
	@DeleteMapping("/users/{id}")
	@LogAnnotation(funs="用户管理页面",name="删除用户数据",type="delete")
	public String delete(@PathVariable("id") String id) {
		userService.delete(id);
		return "删除成功";
	}
}
