package com.kedu.member.dto;

public class MemberDto {

	private String mid;
	private String mpw;
	private String mnm;
	private int mgender;
	private int mmanyn;
	private String mphone;
	private String maddr;
	private String memail;
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
	public String getMnm() {
		return mnm;
	}
	public void setMnm(String mnm) {
		this.mnm = mnm;
	}
	public int getMgender() {
		return mgender;
	}
	public void setMgender(int mgender) {
		this.mgender = mgender;
	}
	public int getMmanyn() {
		return mmanyn;
	}
	public void setMmanyn(int mmanyn) {
		this.mmanyn = mmanyn;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mnm=" + mnm + ", mgender=" + mgender + ", mmanyn=" + mmanyn
				+ ", mphone=" + mphone + ", maddr=" + maddr + ", memail=" + memail + "]";
	}
	
	
}
