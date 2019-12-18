package com.hnkc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnkc.pojo.Sp;
import com.hnkc.mapper.SpMapper;
import com.hnkc.service.SpService;

@Service
public class SpServiceImpl implements SpService {
	@Autowired SpMapper spMapper;
	
	@Override
	public List<Sp> list(Map<String, String> paramMap) {
		return spMapper.list(paramMap);
	}

	@Override
	public Sp get(String tid) {
		return spMapper.get(tid);
	}

	@Override
	public void update(Sp sp) {
		spMapper.update(sp);
	}

	@Override
	public void delete(String tid) {
		spMapper.delete(tid);
	}

	@Override
	public void add(Sp sp) {
		spMapper.add(sp);
	}

}
