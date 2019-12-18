package com.hnkc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnkc.pojo.Jyz;
import com.hnkc.mapper.JyzMapper;
import com.hnkc.service.JyzService;

@Service
public class JyzServiceImpl implements JyzService {
	@Autowired JyzMapper jyzMapper;
	
	@Override
	public List<Jyz> list(Map<String, String> paramMap) {
		return jyzMapper.list(paramMap);
	}

	@Override
	public Jyz get(String tid) {
		return jyzMapper.get(tid);
	}

	@Override
	public void update(Jyz jyz) {
		jyzMapper.update(jyz);
	}

	@Override
	public void delete(String tid) {
		jyzMapper.delete(tid);
	}

	@Override
	public void add(Jyz jyz) {
		jyzMapper.add(jyz);
	}

}
