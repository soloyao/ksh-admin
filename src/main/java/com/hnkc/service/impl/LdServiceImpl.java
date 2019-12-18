package com.hnkc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnkc.mapper.LdMapper;

import com.hnkc.pojo.Ld;
import com.hnkc.service.LdService;

@Service
public class LdServiceImpl implements LdService {
	@Autowired LdMapper ldMapper;
	
	@Override
	public List<Ld> list(Map<String, String> paramMap) {
		return ldMapper.list(paramMap);
	}

	@Override
	public Ld get(String tid) {
		return ldMapper.get(tid);
	}

	@Override
	public void update(Ld ld) {
		ldMapper.update(ld);
	}

	@Override
	public void delete(String tid) {
		ldMapper.delete(tid);
	}

	@Override
	public void add(Ld ld) {
		ldMapper.add(ld);
	}

}
