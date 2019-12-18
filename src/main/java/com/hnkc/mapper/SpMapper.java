package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.Sp;

@Mapper
public interface SpMapper {
	List<Sp> list(Map<String, String> paramMap);
	Sp get(String tid);
	void update(Sp sp);
	void delete(String tid);
	void add(Sp sp);
}
