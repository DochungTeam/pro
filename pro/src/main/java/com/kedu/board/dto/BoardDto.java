package com.kedu.board.dto;

import java.util.Date;

public class BoardDto {

	private int bno;
	private String btitle;
	private String bcontent;
	private Date bwritedt;
	private int bcount;
	private int bboard;
	private Date bupdatedt;
	private String bwriter;
	private int rcount;
	
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Date getBwritedt() {
		return bwritedt;
	}
	public void setBwritedt(Date bwritedt) {
		this.bwritedt = bwritedt;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public int getBboard() {
		return bboard;
	}
	public void setBboard(int bboard) {
		this.bboard = bboard;
	}
	public Date getBupdatedt() {
		return bupdatedt;
	}
	public void setBupdatedt(Date bupdatedt) {
		this.bupdatedt = bupdatedt;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	
	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwritedt=" + bwritedt
				+ ", bcount=" + bcount + ", bboard=" + bboard + ", bupdatedt=" + bupdatedt + ", bwriter=" + bwriter
				+ ", rcount=" + rcount + ", toString()=" + super.toString() + "]";
	}
	
}
