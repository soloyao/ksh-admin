package com.hnkc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hnkc.annotation.LogAnnotation;
import com.hnkc.pojo.Ld;
import com.hnkc.service.LdService;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class LdController {
	@Autowired LdService ldService;
	
	@GetMapping("/lds")
	@LogAnnotation(desc = "分页获取旅店数据")
	public PageInfo<Ld> list(@RequestParam(value = "start", defaultValue = "1") int start,
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
		List<Ld> lds = ldService.list(paramMap);
		PageInfo<Ld> page = new PageInfo<Ld>(lds, 5);
		return page;
	}
	
	@GetMapping("/lds/{tid}")
	@LogAnnotation(desc = "获取单个旅店")
	public Ld get(@PathVariable("tid") String tid) {
		Ld ld = ldService.get(tid);
		return ld;
	}
	
	@PostMapping("/lds")
	@LogAnnotation(desc = "新增旅店")
	public String add(@RequestBody Ld ld) {
		ld.setQydm(ld.getZzjgdm().substring(0, 4));
		ldService.add(ld);
		return "新增成功";
	}
	
	@PutMapping("/lds")
	@LogAnnotation(desc = "修改旅店")
	public String update(@RequestBody Ld ld) {
		ld.setQydm(ld.getZzjgdm().substring(0, 4));
		ldService.update(ld);
		return "修改成功";
	}
	
	@DeleteMapping("/lds/{tid}")
	@LogAnnotation(desc = "删除旅店")
	public String delete(@PathVariable("tid") String tid) {
		ldService.delete(tid);
		return "删除成功";
	}
}
