package com.hnkc.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.hnkc.QxOracleApplication;
import com.hnkc.mapper.PermissionMapper;
import com.hnkc.mapper.UserMapper;
import com.hnkc.service.PermissionService;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = QxOracleApplication.class)
public class TestJunit {
	@Autowired UserMapper userMapper;
	@Autowired PermissionMapper permissionMapper;
	@Autowired PermissionService permissionService;
	
	@Test
	public void test() {
		
	}
	
}
