package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.Ld;

public interface LdService {
	List<Ld> list(Map<String, String> paramMap);
	Ld get(String tid);
	void update(Ld ld);
	void delete(String tid);
	void add(Ld ld);
}
