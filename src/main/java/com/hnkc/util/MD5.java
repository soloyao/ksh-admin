package com.hnkc.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {

	public static String PW = "urE9iys4s";
	public static String SPID = "154";
	public static void main(String[] args) throws Exception {
		String	md5 = MD5.md5("110");
		System.out.println(md5);
	}
	
	
	public static String md5(String rand) throws NoSuchAlgorithmException {
		String msg = rand;
		MessageDigest messageDigest = MessageDigest.getInstance("MD5");
		messageDigest.update(msg.getBytes());
		byte[] digest = messageDigest.digest();

		String new_pw = byte2hex(digest);

		return new_pw.toLowerCase();
	}

	private static String byte2hex(byte[] b) {
		StringBuilder buf = new StringBuilder();

		for (byte c : b) {
			buf.append(String.format("%02x", c).toUpperCase());
		}

		return buf.toString();
	}

	private static String CODE = "gbk";

}
