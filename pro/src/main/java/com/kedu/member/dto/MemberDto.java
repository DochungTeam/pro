package com.kedu.member.dto;

import java.util.Date;

public class MemberDto {

	private String	mid;
	private String	mpw;
	private String	mnm;
	private String	muuid;
	private int		mgender;
	private int		mmanyn;
	private String	mphone;
	private String	mzipcd;
	private String	maddrbase;
	private String	maddrsemi;
	private String	memail;
	private String	firstmemail;
	private String	secondmemail;
	private Date	mregdate;
	
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
	public String getMuuid() {
		return muuid;
	}
	public void setMuuid(String muuid) {
		this.muuid = muuid;
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
	public String getMzipcd() {
		return mzipcd;
	}
	public void setMzipcd(String mzipcd) {
		this.mzipcd = mzipcd;
	}
	public String getMaddrbase() {
		return maddrbase;
	}
	public void setMaddrbase(String maddrbase) {
		this.maddrbase = maddrbase;
	}
	public String getMaddrsemi() {
		return maddrsemi;
	}
	public void setMaddrsemi(String maddrsemi) {
		this.maddrsemi = maddrsemi;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getFirstmemail() {
		return firstmemail;
	}
	public void setFirstmemail(String firstmemail) {
		this.firstmemail = firstmemail;
	}
	public String getSecondmemail() {
		return secondmemail;
	}
	public void setSecondmemail(String secondmemail) {
		this.secondmemail = secondmemail;
	}
	public Date getMregdate() {
		return mregdate;
	}
	public void setMregdate(Date mregdate) {
		this.mregdate = mregdate;
	}
	
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mnm=" + mnm + ", muuid=" + muuid + ", mgender=" + mgender
				+ ", mmanyn=" + mmanyn + ", mphone=" + mphone + ", mzipcd=" + mzipcd + ", maddrbase=" + maddrbase
				+ ", maddrsemi=" + maddrsemi + ", memail=" + memail + ", firstmemail=" + firstmemail + ", secondmemail="
				+ secondmemail + ", mregdate=" + mregdate + "]";
	}
	
	
		
}
