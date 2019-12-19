package com.hnkc.util;

import java.util.UUID;

public class StringUtil {
	public static String getGUID() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
}
