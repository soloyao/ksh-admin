package com.hnkc.util;

import com.alibaba.fastjson.JSONObject;

public class JsonUtil {
	public static String result(int code, String data, String msg) {
		JSONObject json = new JSONObject();
		json.put("code", code);
		json.put("data", data);
		json.put("msg", msg);
		return json.toJSONString();
	}
}
