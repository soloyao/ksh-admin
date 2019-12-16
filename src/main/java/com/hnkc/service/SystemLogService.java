package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.SystemLog;


public interface SystemLogService {
	void save(SystemLog systemLog);
	List<SystemLog> list(Map<String, String> paramMap);
}
