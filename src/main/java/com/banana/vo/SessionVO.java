package com.banana.vo;

public class SessionVO {
	String nickname ,mid, msfile;
	int result;
	
	public String getMsfile() {
		return msfile;
	}
	public void setMsfile(String msfile) {
		this.msfile = msfile;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
}
