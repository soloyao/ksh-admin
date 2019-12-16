package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.Role;
import com.hnkc.pojo.RolePermission;

@Mapper
public interface RoleMapper {
	int exist(Role role);
	List<Role> list(Map<String, String> paramMap);
	Role get(int id);
	void delete(int id);
	void deletePermissionByRoleId(int id);
	void deleteUserByRoleId(int id);
	void add(Role role);
	void update(Role role);
	void addPermissionByRoleId(RolePermission rolePermission);
}
