package com.hnkc.pojo;

import java.util.List;

import com.hnkc.util.StringUtil;

public class User {
	private String id = "";
	private String yhzh = "";
	private String yhmm = "";
	private String yhxm = "";
	private String jybh = "";
	private String jylx = "";
	private String zw = "";
	private String yhxb = "";
	private String sjhm = "";
	private String cjsj = "";
	private String isdel = "";
	private String zzjgdm = "";
	private String zzjgmc = "";
	private String qydm = "";
	private List<Role> roles;
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getYhzh() {
		return yhzh;
	}
	public void setYhzh(String yhzh) {
		this.yhzh = yhzh;
	}
	public String getYhmm() {
		return yhmm;
	}
	public void setYhmm(String yhmm) {
		this.yhmm = yhmm;
	}
	public String getYhxm() {
		return yhxm;
	}
	public void setYhxm(String yhxm) {
		this.yhxm = yhxm;
	}
	public String getJybh() {
		return jybh;
	}
	public void setJybh(String jybh) {
		this.jybh = jybh;
	}
	public String getJylx() {
		return jylx;
	}
	public void setJylx(String jylx) {
		this.jylx = jylx;
	}
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
	}
	public String getYhxb() {
		return yhxb;
	}
	public void setYhxb(String yhxb) {
		this.yhxb = yhxb;
	}
	public String getSjhm() {
		return sjhm;
	}
	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}
	public String getCjsj() {
		return cjsj;
	}
	public void setCjsj(String cjsj) {
		this.cjsj = cjsj;
	}
	public String getIsdel() {
		return isdel;
	}
	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}
	public String getZzjgdm() {
		return zzjgdm;
	}
	public void setZzjgdm(String zzjgdm) {
		this.zzjgdm = zzjgdm;
	}
	public String getZzjgmc() {
		return zzjgmc;
	}
	public void setZzjgmc(String zzjgmc) {
		this.zzjgmc = zzjgmc;
	}
	public String getQydm() {
		return qydm;
	}
	public void setQydm(String qydm) {
		this.qydm = qydm;
	}
}
