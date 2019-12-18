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
import com.hnkc.pojo.Wb;
import com.hnkc.service.WbService;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class WbController {
	@Autowired WbService wbService;
	
	@GetMapping("/wbs")
	@LogAnnotation(desc = "分页获取网吧数据")
	public PageInfo<Wb> list(@RequestParam(value = "start", defaultValue = "1") int start,
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
		List<Wb> wbs = wbService.list(paramMap);
		PageInfo<Wb> page = new PageInfo<Wb>(wbs, 5);
		return page;
	}
	
	@GetMapping("/wbs/{tid}")
	@LogAnnotation(desc = "获取单个网吧")
	public Wb get(@PathVariable("tid") String tid) {
		Wb wb = wbService.get(tid);
		return wb;
	}
	
	@PostMapping("/wbs")
	@LogAnnotation(desc = "新增网吧")
	public String add(@RequestBody Wb wb) {
		wb.setQydm(wb.getZzjgdm().substring(0, 4));
		wbService.add(wb);
		return "新增成功";
	}
	
	@PutMapping("/wbs")
	@LogAnnotation(desc = "修改网吧")
	public String update(@RequestBody Wb wb) {
		wb.setQydm(wb.getZzjgdm().substring(0, 4));
		wbService.update(wb);
		return "修改成功";
	}
	
	@DeleteMapping("/wbs/{tid}")
	@LogAnnotation(desc = "删除网吧")
	public String delete(@PathVariable("tid") String tid) {
		wbService.delete(tid);
		return "删除成功";
	}
}
