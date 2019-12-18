package com.hnkc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnkc.pojo.Yy;
import com.hnkc.mapper.YyMapper;
import com.hnkc.service.YyService;

@Service
public class YyServiceImpl implements YyService {
	@Autowired YyMapper yyMapper;
	
	@Override
	public List<Yy> list(Map<String, String> paramMap) {
		return yyMapper.list(paramMap);
	}

	@Override
	public Yy get(String tid) {
		return yyMapper.get(tid);
	}

	@Override
	public void update(Yy yy) {
		yyMapper.update(yy);
	}

	@Override
	public void delete(String tid) {
		yyMapper.delete(tid);
	}

	@Override
	public void add(Yy yy) {
		yyMapper.add(yy);
	}

}
