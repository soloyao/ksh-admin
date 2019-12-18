package com.hnkc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnkc.pojo.Permission;
import com.hnkc.mapper.PermissionMapper;
import com.hnkc.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {
	@Autowired PermissionMapper permissionMapper;

	@Override
	public List<Permission> list(Map<String, String> paramMap) {
		return permissionMapper.list(paramMap);
	}

	@Override
	public Permission get(String id) {
		return permissionMapper.get(id);
	}

	@Override
	public void delete(String id) {
		permissionMapper.delete(id);//删除本身
		permissionMapper.deleteRoleByPermissionId(id);//删除和菜单关联的角色
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("flzj", String.valueOf(id));
		List<Permission> list = permissionMapper.list(paramMap);
		for (Permission permission : list) {
			permissionMapper.deleteRoleByPermissionId(permission.getId());
		}
		permissionMapper.deleteChildrenByParentId(id);//删除父菜单下的所有子菜单
	}

	@Override
	public void add(Permission permission) {
		permissionMapper.add(permission);
	}

	@Override
	public void update(Permission permission) {
		permissionMapper.update(permission);
	}

	@Override
	public int exist(Permission permission) {
		return permissionMapper.exist(permission);
	}

	@Override
	public List<Permission> listParentPermissions() {
		return permissionMapper.listParentPermissions();
	}

	@Override
	public List<Permission> listPermissions() {
		return permissionMapper.listPermissions();
	}

}
