package com.hnkc.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnkc.pojo.Permission;
import com.hnkc.pojo.Role;
import com.hnkc.pojo.RolePermission;
import com.hnkc.mapper.RoleMapper;
import com.hnkc.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired RoleMapper roleMapper;

	@Override
	public List<Role> list(Map<String, String> paramMap) {
		return roleMapper.list(paramMap);
	}

	@Override
	public Role get(String id) {
		return roleMapper.get(id);
	}

	@Override
	public void delete(String id) {
		roleMapper.delete(id);//删除角色
		roleMapper.deletePermissionByRoleId(id);//删除角色对应的用户
		roleMapper.deleteUserByRoleId(id);//删除角色对应的菜单
	}

	@Override
	public void add(Role role) {
		roleMapper.add(role);
		if (null != role.getPermissions()) {
			for (Permission permission : role.getPermissions()) {
				RolePermission rolePermission = new RolePermission();
				rolePermission.setCdzj(permission.getId());
				rolePermission.setJszj(role.getId());
				roleMapper.addPermissionByRoleId(rolePermission);
			}
		}
	}

	@Override
	public void update(Role role) {
		//删除当前角色菜单
		roleMapper.deletePermissionByRoleId(role.getId());
		//修改角色对应菜单
		if (null != role.getPermissions()) {
			for (Permission permission : role.getPermissions()) {
				RolePermission rolePermission = new RolePermission();
				rolePermission.setCdzj(permission.getId());
				rolePermission.setJszj(role.getId());
				roleMapper.addPermissionByRoleId(rolePermission);
			}
		}
		//修改角色基础信息
		roleMapper.update(role);
	}

	@Override
	public void updateBatch(Set<String> roleIds, Set<String> permissionIds) {
		//删除当前角色关联权限
		for (String roleId : roleIds) {
			roleMapper.deletePermissionByRoleId(roleId);
		}
		//修改角色关联权限
		if (null != permissionIds) {//为空则表示去掉角色所有权限
			for (String roleId : roleIds) {
				for (String permissionId : permissionIds) {
					RolePermission rolePermission = new RolePermission();
					rolePermission.setCdzj(permissionId);
					rolePermission.setJszj(roleId);
					roleMapper.addPermissionByRoleId(rolePermission);
				}
			}
		}
	}
	
	@Override
	public int exist(Role role) {
		return roleMapper.exist(role);
	}

}
