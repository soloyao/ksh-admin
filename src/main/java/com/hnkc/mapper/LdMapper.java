package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.Ld;

@Mapper
public interface LdMapper {
	List<Ld> list(Map<String, String> paramMap);
	Ld get(String tid);
	void update(Ld ld);
	void delete(String tid);
	void add(Ld ld);
}
