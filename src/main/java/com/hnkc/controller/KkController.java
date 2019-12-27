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
import com.hnkc.pojo.Kk;
import com.hnkc.service.KkService;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class KkController {
	@Autowired KkService kkService;
	
	@GetMapping("/kks")
	public PageInfo<Kk> list(@RequestParam(value = "start", defaultValue = "1") int start,
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
		List<Kk> kks = kkService.list(paramMap);
		PageInfo<Kk> page = new PageInfo<Kk>(kks, 5);
		return page;
	}
	
	@GetMapping("/kks/{tid}")
	public Kk get(@PathVariable("tid") String tid) {
		Kk kk = kkService.get(tid);
		return kk;
	}
	
	@PostMapping("/kks")
	@LogAnnotation(funs="卡口管理页面",name="新增卡口数据",type="insert")
	public String add(@RequestBody Kk kk) {
		kk.setQydm(kk.getZzjgdm().substring(0, 4));
		kkService.add(kk);
		return "新增成功";
	}
	
	@PutMapping("/kks")
	@LogAnnotation(funs="卡口管理页面",name="修改卡口数据",type="update")
	public String update(@RequestBody Kk kk) {
		kk.setQydm(kk.getZzjgdm().substring(0, 4));
		kkService.update(kk);
		return "修改成功";
	}
	
	@DeleteMapping("/kks/{tid}")
	@LogAnnotation(funs="卡口管理页面",name="删除卡口数据",type="delete")
	public String delete(@PathVariable("tid") String tid) {
		kkService.delete(tid);
		return "删除成功";
	}
}
