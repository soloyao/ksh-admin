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
import com.hnkc.pojo.Sp;
import com.hnkc.service.SpService;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class SpController {
	@Autowired SpService spService;
	
	@GetMapping("/sps")
	@LogAnnotation(desc = "分页获取视频数据")
	public PageInfo<Sp> list(@RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "zzjgdm", defaultValue = "") String zzjgdm) {
		PageHelper.startPage(start, size, "createtime desc");
		Map<String, String> paramMap = new HashMap<String, String>();
		if (!StringUtils.isEmpty(keyword)) {
			paramMap.put("keyword", "%" + keyword + "%");
		}
		if (!StringUtils.isEmpty(zzjgdm)) {
			paramMap.put("zzjgdm", zzjgdm);
		}
		List<Sp> sps = spService.list(paramMap);
		PageInfo<Sp> page = new PageInfo<Sp>(sps, 5);
		return page;
	}
	
	@GetMapping("/sps/{tid}")
	@LogAnnotation(desc = "获取单个视频")
	public Sp get(@PathVariable("tid") String tid) {
		Sp sp = spService.get(tid);
		return sp;
	}
	
	@PostMapping("/sps")
	@LogAnnotation(desc = "新增视频")
	public String add(@RequestBody Sp sp) {
		sp.setQydm(sp.getZzjgdm().substring(0, 4));
		spService.add(sp);
		return "新增成功";
	}
	
	@PutMapping("/sps")
	@LogAnnotation(desc = "修改视频")
	public String update(@RequestBody Sp sp) {
		sp.setQydm(sp.getZzjgdm().substring(0, 4));
		spService.update(sp);
		return "修改成功";
	}
	
	@DeleteMapping("/sps/{tid}")
	@LogAnnotation(desc = "删除视频")
	public String delete(@PathVariable("tid") String tid) {
		spService.delete(tid);
		return "删除成功";
	}
}
