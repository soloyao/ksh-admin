package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.SystemLog;

@Mapper
public interface SystemLogMapper {
	void save(SystemLog systemLog);
	List<SystemLog> list(Map<String, String> paramMap);
}
