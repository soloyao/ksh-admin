package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.Kk;

@Mapper
public interface KkMapper {
	List<Kk> list(Map<String, String> paramMap);
	Kk get(String tid);
	void update(Kk kk);
	void delete(String tid);
	void add(Kk kk);
}
