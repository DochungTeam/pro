package com.kedu.board.dto;

import java.util.Date;

public class BoardReplyDto {

	private int rno;
	private int bno;
	private String rcontent;
	private String mid;
	private Date rwritedt;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getRwritedt() {
		return rwritedt;
	}
	public void setRwritedt(Date rwritedt) {
		this.rwritedt = rwritedt;
	}
	
	@Override
	public String toString() {
		return "BoardReplyDto [rno=" + rno + ", bno=" + bno + ", rcontent=" + rcontent + ", mid=" + mid + ", rwritedt="
				+ rwritedt + ", toString()=" + super.toString() + "]";
	}
}
