package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.hnkc.pojo.Permission;
import com.hnkc.pojo.User;

public interface PermissionService {
	int exist(Permission permission);
	List<Permission> list(Map<String, String> paramMap);
	Permission get(int id);
	void delete(int id);
	void add(Permission permission);
	void update(Permission permission);
	JSONArray listByUser(User user);
	List<Permission> listParentPermissions();
	List<Permission> listPermissions();
}
