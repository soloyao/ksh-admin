package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.Jyz;

public interface JyzService {
	List<Jyz> list(Map<String, String> paramMap);
	Jyz get(String tid);
	void update(Jyz jyz);
	void delete(String tid);
	void add(Jyz jyz);
}
