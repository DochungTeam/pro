package com.kedu.house.dto;

import java.util.Date;

public class HouseReplyDto {

	private int hrno;
	private int hno;
	private String hrcontent;
	private String mid;
	private Date hrwritedt;
	private Date hrupdatedt;
	public int getHrno() {
		return hrno;
	}
	public void setHrno(int hrno) {
		this.hrno = hrno;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getHrcontent() {
		return hrcontent;
	}
	public void setHrcontent(String hrcontent) {
		this.hrcontent = hrcontent;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getHrwritedt() {
		return hrwritedt;
	}
	public void setHrwritedt(Date hrwritedt) {
		this.hrwritedt = hrwritedt;
	}
	public Date getHrupdatedt() {
		return hrupdatedt;
	}
	public void setHrupdatedt(Date hrupdatedt) {
		this.hrupdatedt = hrupdatedt;
	}
	@Override
	public String toString() {
		return "HouseReplyDto [hrno=" + hrno + ", hno=" + hno + ", hrcontent=" + hrcontent + ", mid=" + mid
				+ ", hrwritedt=" + hrwritedt + ", hrupdatedt=" + hrupdatedt + "]";
	}
	
	
}
