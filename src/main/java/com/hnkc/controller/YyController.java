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
import com.hnkc.pojo.Yy;
import com.hnkc.service.YyService;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
public class YyController {
	@Autowired YyService yyService;
	
	@GetMapping("/yys")
	public PageInfo<Yy> list(@RequestParam(value = "start", defaultValue = "1") int start,
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
		List<Yy> yys = yyService.list(paramMap);
		PageInfo<Yy> page = new PageInfo<Yy>(yys, 5);
		return page;
	}
	
	@GetMapping("/yys/{tid}")
	public Yy get(@PathVariable("tid") String tid) {
		Yy yy = yyService.get(tid);
		return yy;
	}
	
	@PostMapping("/yys")
	@LogAnnotation(funs="医院管理页面",name="新增医院数据",type="query")
	public String add(@RequestBody Yy yy) {
		yy.setQydm(yy.getZzjgdm().substring(0, 4));
		yyService.add(yy);
		return "新增成功";
	}
	
	@PutMapping("/yys")
	@LogAnnotation(funs="医院管理页面",name="修改医院数据",type="update")
	public String update(@RequestBody Yy yy) {
		yy.setQydm(yy.getZzjgdm().substring(0, 4));
		yyService.update(yy);
		return "修改成功";
	}
	
	@DeleteMapping("/yys/{tid}")
	@LogAnnotation(funs="医院管理页面",name="删除医院数据",type="delete")
	public String delete(@PathVariable("tid") String tid) {
		yyService.delete(tid);
		return "删除成功";
	}
}
