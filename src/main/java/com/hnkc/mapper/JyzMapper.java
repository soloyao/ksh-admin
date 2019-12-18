package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.Jyz;

@Mapper
public interface JyzMapper {
	List<Jyz> list(Map<String, String> paramMap);
	Jyz get(String tid);
	void update(Jyz jyz);
	void delete(String tid);
	void add(Jyz jyz);
}
