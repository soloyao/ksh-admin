package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.Kk;

public interface KkService {
	List<Kk> list(Map<String, String> paramMap);
	Kk get(String tid);
	void update(Kk kk);
	void delete(String tid);
	void add(Kk kk);
}
