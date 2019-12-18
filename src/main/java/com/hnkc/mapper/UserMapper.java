package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.PcsTree;
import com.hnkc.pojo.User;
import com.hnkc.pojo.UserRole;


@Mapper
public interface UserMapper {
	User login(User user);
	int exist(User user);
	List<User> list(Map<String, String> paramMap);
	void add(User user);
	void update(User user);
	void delete(String id);
	void deleteRoleByUserId(String id);
	User get(String id);
	void addRoleByUserId(UserRole userRole);
	List<PcsTree> listPcsTree();
}
