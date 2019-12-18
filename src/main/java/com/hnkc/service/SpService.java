package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.Sp;

public interface SpService {
	List<Sp> list(Map<String, String> paramMap);
	Sp get(String tid);
	void update(Sp sp);
	void delete(String tid);
	void add(Sp sp);
}
