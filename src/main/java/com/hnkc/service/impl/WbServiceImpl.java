package com.hnkc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnkc.pojo.Wb;
import com.hnkc.mapper.WbMapper;
import com.hnkc.service.WbService;

@Service
public class WbServiceImpl implements WbService {
	@Autowired WbMapper wbMapper;
	
	@Override
	public List<Wb> list(Map<String, String> paramMap) {
		return wbMapper.list(paramMap);
	}

	@Override
	public Wb get(String tid) {
		return wbMapper.get(tid);
	}

	@Override
	public void update(Wb wb) {
		wbMapper.update(wb);
	}

	@Override
	public void delete(String tid) {
		wbMapper.delete(tid);
	}

	@Override
	public void add(Wb wb) {
		wbMapper.add(wb);
	}

}
