package com.hnkc.pojo;

public class SystemLog {
	private String tid;
	private String appName = "可视化后台管理";
	private String funs = "";
	private String name = "";
	private String msg = "";
	private String userId = "";
	private String userAccount = "";
	private String userName = "";
	private String ip = "";
	private String type = "";
	private String createtime = "";
	private String zzjgdm = "";
	private String zzjgmc = "";
	@Override
	public String toString() {
		return "[appName=" + this.appName + ",funs=" + this.funs + ",name=" + this.name + ",msg=" + this.msg + ",userId=" + this.userId + ",userAccound=" + this.userAccount
				+ ",userName=" + this.userName + ",ip=" + this.ip + ",type=" + this.type + ",createtime=" + this.createtime + ",zzjgdm=" + this.zzjgdm + ",zzjgmc=" + this.zzjgmc;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getFuns() {
		return funs;
	}
	public void setFuns(String funs) {
		this.funs = funs;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
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
}
