package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.Wb;

public interface WbService {
	List<Wb> list(Map<String, String> paramMap);
	Wb get(String tid);
	void update(Wb wb);
	void delete(String tid);
	void add(Wb wb);
}
