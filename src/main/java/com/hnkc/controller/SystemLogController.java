package com.hnkc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hnkc.annotation.LogAnnotation;
import com.hnkc.pojo.Jyz;
import com.hnkc.pojo.SystemLog;
import com.hnkc.service.SystemLogService;

@RestController
public class SystemLogController {
	@Autowired SystemLogService systemLogService;
	
	@GetMapping("/systemLogs")
	public PageInfo<SystemLog> list(@RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "zzjgdm", defaultValue = "") String zzjgdm) {
		PageHelper.startPage(start, size, "createtime desc");
		Map<String, String> paramMap = new HashMap<String, String>();
		if (!StringUtils.isEmpty(keyword)) {
			paramMap.put("keyword", keyword);
		}
		if (!StringUtils.isEmpty(zzjgdm)) {
			paramMap.put("zzjgdm", zzjgdm);
		}
		List<SystemLog> systemLogs = systemLogService.list(paramMap);
		PageInfo<SystemLog> page = new PageInfo<SystemLog>(systemLogs, 5);
		return page;
	}
}
