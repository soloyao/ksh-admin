package com.hnkc.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.hnkc.pojo.PcsTree;
import com.hnkc.pojo.Role;
import com.hnkc.pojo.User;
import com.hnkc.pojo.UserDljg;
import com.hnkc.pojo.UserRole;
import com.hnkc.mapper.UserMapper;
import com.hnkc.service.UserService;
import com.hnkc.util.StringUtil;


@Service
public class UserServiceImpl implements UserService {
	@Autowired UserMapper userMapper;
	
	@Override
	public User login(User user) {
		return userMapper.login(user);
	}

	@Override
	public int exist(User user) {
		return userMapper.exist(user);
	}

	@Override
	public List<User> list(Map<String, String> paramMap) {
		return userMapper.list(paramMap);
	}

	@Override
	public void add(User user) {
		userMapper.add(user);
		if (null != user.getRoles()) {
			for (Role role : user.getRoles()) {
				UserRole userRole = new UserRole();
				userRole.setJszj(role.getId());
				userRole.setYhzj(user.getId());
				userMapper.addRoleByUserId(userRole);
			}
		}
	}

	@Override
	public void update(User user) {
		//删除当前用户角色
		userMapper.deleteRoleByUserId(user.getId());
		//修改用户对应角色
		if (null != user.getRoles()) {
			for (Role role : user.getRoles()) {
				UserRole userRole = new UserRole();
				userRole.setJszj(role.getId());
				userRole.setYhzj(user.getId());
				userMapper.addRoleByUserId(userRole);
			}
		}
		//修改用户基础信息
		userMapper.update(user);
	}
	
	@Override
	public void updateBatch(Set<String> userIds, Set<String> roleIds) {
		//删除当前用户关联角色
		for (String userId : userIds) {
			userMapper.deleteRoleByUserId(userId);
		}
		//修改用户关联角色
		if (null != roleIds) {//为空则表示去掉用户所有角色
			for (String userId : userIds) {
				for (String roleId : roleIds) {
					UserRole userRole = new UserRole();
					userRole.setJszj(roleId);
					userRole.setYhzj(userId);
					userMapper.addRoleByUserId(userRole);
				}
			}
		}
	}

	@Override
	public void updateBatchDljg(Set<String> userIds, String dljgId, String dljgName) {
		//删除当前用户关联代理机构
		for (String userId : userIds) {
			userMapper.deleteDljgByUserId(userId);
		}
		//修改用户关联代理机构
		if (!StringUtils.isEmpty(dljgId)) {
			for (String yhzj : userIds) {
				UserDljg userDljg = new UserDljg();
				userDljg.setYhzj(yhzj);
				userDljg.setDljgzj(dljgId);
				userDljg.setDljgname(dljgName);
				userMapper.addDljgByUserId(userDljg);
			}
		}
	}
	
	@Override
	public void delete(String id) {
		userMapper.delete(id);//删除用户
		userMapper.deleteRoleByUserId(id);//同时删除用户对应的角色
	}

	@Override
	public User get(String id) {
		return userMapper.get(id);
	}

	@Override
	public List<PcsTree> listPcsTree() {
		return userMapper.listPcsTree();
	}

}
