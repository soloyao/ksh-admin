package com.hnkc.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.hnkc.pojo.User;

public interface UserService {
	User login(User user);
	int exist(User user);
	List<User> list(Map<String, String> paramMap);
	void add(User user);
	void update(User user);
	void delete(int id);
	User get(int id);
	void updateBatch(Set<String> userIds, Set<String> roleIds);
}
