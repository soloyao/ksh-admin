package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.Hero;

public interface HeroService {
	List<Hero> list(Map<String, String> paramMap);
	void add(Hero hero);
	void delete(int id);
	void update(Hero hero);
	Hero get(int id);
}
