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
	@LogAnnotation(funs="网吧管理页面",name="分页获取网吧数据",type="query")
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
	@LogAnnotation(funs="网吧管理页面",name="根据编号获取网吧数据",type="query")
	public Wb get(@PathVariable("tid") String tid) {
		Wb wb = wbService.get(tid);
		return wb;
	}
	
	@PostMapping("/wbs")
	@LogAnnotation(funs="网吧管理页面",name="新增网吧数据",type="insert")
	public String add(@RequestBody Wb wb) {
		wb.setQydm(wb.getZzjgdm().substring(0, 4));
		wbService.add(wb);
		return "新增成功";
	}
	
	@PutMapping("/wbs")
	@LogAnnotation(funs="网吧管理页面",name="修改网吧数据",type="update")
	public String update(@RequestBody Wb wb) {
		wb.setQydm(wb.getZzjgdm().substring(0, 4));
		wbService.update(wb);
		return "修改成功";
	}
	
	@DeleteMapping("/wbs/{tid}")
	@LogAnnotation(funs="网吧管理页面",name="删除网吧数据",type="delete")
	public String delete(@PathVariable("tid") String tid) {
		wbService.delete(tid);
		return "删除成功";
	}
}
