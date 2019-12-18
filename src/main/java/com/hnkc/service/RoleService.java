package com.hnkc.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.hnkc.pojo.Role;


public interface RoleService {
	int exist(Role role);
	List<Role> list(Map<String, String> paramMap);
	Role get(String id);
	void delete(String id);
	void add(Role role);
	void update(Role role);
	void updateBatch(Set<String> roleIds, Set<String> permissionIds);
}
