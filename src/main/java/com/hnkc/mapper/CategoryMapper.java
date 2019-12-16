package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.Category;

@Mapper
public interface CategoryMapper {
	List<Category> list(Map<String, String> paramMap);
	void add(Category category);
	void delete(int id);
	void update(Category category);
	Category get(int id);
}
