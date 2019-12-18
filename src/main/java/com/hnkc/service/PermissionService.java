package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.Permission;

public interface PermissionService {
	int exist(Permission permission);
	List<Permission> list(Map<String, String> paramMap);
	Permission get(String id);
	void delete(String id);
	void add(Permission permission);
	void update(Permission permission);
	List<Permission> listParentPermissions();
	List<Permission> listPermissions();
}
