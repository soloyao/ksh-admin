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
import com.hnkc.pojo.Jyz;
import com.hnkc.service.JyzService;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class JyzController {
	@Autowired JyzService jyzService;
	
	@GetMapping("/jyzs")
	@LogAnnotation(desc = "分页获取加油站数据")
	public PageInfo<Jyz> list(@RequestParam(value = "start", defaultValue = "1") int start,
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
		List<Jyz> jyzs = jyzService.list(paramMap);
		PageInfo<Jyz> page = new PageInfo<Jyz>(jyzs, 5);
		return page;
	}
	
	@GetMapping("/jyzs/{tid}")
	@LogAnnotation(desc = "获取单个加油站")
	public Jyz get(@PathVariable("tid") String tid) {
		Jyz jyz = jyzService.get(tid);
		return jyz;
	}
	
	@PostMapping("/jyzs")
	@LogAnnotation(desc = "新增加油站")
	public String add(@RequestBody Jyz jyz) {
		jyz.setQydm(jyz.getZzjgdm().substring(0, 4));
		jyzService.add(jyz);
		return "新增成功";
	}
	
	@PutMapping("/jyzs")
	@LogAnnotation(desc = "修改加油站")
	public String update(@RequestBody Jyz jyz) {
		jyz.setQydm(jyz.getZzjgdm().substring(0, 4));
		jyzService.update(jyz);
		return "修改成功";
	}
	
	@DeleteMapping("/jyzs/{tid}")
	@LogAnnotation(desc = "删除加油站")
	public String delete(@PathVariable("tid") String tid) {
		jyzService.delete(tid);
		return "删除成功";
	}
}
