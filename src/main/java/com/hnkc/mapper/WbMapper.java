package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.Wb;

@Mapper
public interface WbMapper {
	List<Wb> list(Map<String, String> paramMap);
	Wb get(String tid);
	void update(Wb wb);
	void add(Wb wb);
	void delete(String tid);
}
