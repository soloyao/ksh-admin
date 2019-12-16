package com.hnkc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hnkc.pojo.Hero;

@Mapper
public interface HeroMapper {
	List<Hero> list(Map<String, String> paramMap);
	void add(Hero hero);
	void delete(int id);
	void update(Hero hero);
	Hero get(int id);
}
