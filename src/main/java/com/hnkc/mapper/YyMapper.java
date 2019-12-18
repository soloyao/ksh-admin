package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.Yy;

@Mapper
public interface YyMapper {
	List<Yy> list(Map<String, String> paramMap);
	Yy get(String tid);
	void update(Yy yy);
	void add(Yy yy);
	void delete(String tid);
}
