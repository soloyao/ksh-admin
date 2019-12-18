package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.Yy;

public interface YyService {
	List<Yy> list(Map<String, String> paramMap);
	Yy get(String tid);
	void update(Yy yy);
	void delete(String tid);
	void add(Yy yy);
}
