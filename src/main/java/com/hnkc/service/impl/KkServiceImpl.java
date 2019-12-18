package com.hnkc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnkc.pojo.Kk;
import com.hnkc.mapper.KkMapper;
import com.hnkc.service.KkService;

@Service
public class KkServiceImpl implements KkService {
	@Autowired KkMapper kkMapper;
	
	@Override
	public List<Kk> list(Map<String, String> paramMap) {
		return kkMapper.list(paramMap);
	}

	@Override
	public Kk get(String tid) {
		return kkMapper.get(tid);
	}

	@Override
	public void update(Kk kk) {
		kkMapper.update(kk);
	}

	@Override
	public void delete(String tid) {
		kkMapper.delete(tid);
	}

	@Override
	public void add(Kk kk) {
		kkMapper.add(kk);
	}

}
