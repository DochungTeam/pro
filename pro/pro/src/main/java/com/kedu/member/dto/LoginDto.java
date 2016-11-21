package com.kedu.member.dto;

public class LoginDto {
	
	private String mid;
	private String mpw;
	private boolean mCookie;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public boolean ismCookie() {
		return mCookie;
	}
	public void setmCookie(boolean mCookie) {
		this.mCookie = mCookie;
	}
	@Override
	public String toString() {
		return "LoginDto [mid=" + mid + ", mpw=" + mpw + ", mCookie=" + mCookie + "]";
	}
	
	

}
