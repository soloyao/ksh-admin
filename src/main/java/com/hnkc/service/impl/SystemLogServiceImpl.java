package com.hnkc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnkc.mapper.SystemLogMapper;
import com.hnkc.pojo.SystemLog;
import com.hnkc.service.SystemLogService;


@Service
public class SystemLogServiceImpl implements SystemLogService {
	@Autowired SystemLogMapper systemLogMapper;
	
	@Override
	public void save(SystemLog systemLog) {
		systemLogMapper.save(systemLog);
	}

	@Override
	public List<SystemLog> list(Map<String, String> paramMap) {
		return systemLogMapper.list(paramMap);
	}

}
