package com.kedu.house.dto;

import java.util.Arrays;
import java.util.Date;

public class HouseDto {
	private int hno;
	private String hnm;
	private String hcontent;
	private String hkind;
	private String hphone;
	private String hmenu;
	private String hdetail;
	private String himg;
	private String hspecial;
	private String hzipcode;
	private String haddr;
	private String haddr2;
	private String hlevel;
	private String hvisit;
	private String htime;
	private String hholiday;
	private Date hwriterdt;
	private String hlocation;
	private Date hregdate;
	private String hmapx;
	private String hmapy;
	private String[] files;
	private String hurl;
	private int hreplycnt;
	private int hviewcnt;
	private String hlink;
	private String fullName;
	
	
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getHnm() {
		return hnm;
	}
	public void setHnm(String hnm) {
		this.hnm = hnm;
	}
	public String getHcontent() {
		return hcontent;
	}
	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}
	public String getHkind() {
		return hkind;
	}
	public void setHkind(String hkind) {
		this.hkind = hkind;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public String getHmenu() {
		return hmenu;
	}
	public void setHmenu(String hmenu) {
		this.hmenu = hmenu;
	}
	public String getHdetail() {
		return hdetail;
	}
	public void setHdetail(String hdetail) {
		this.hdetail = hdetail;
	}
	public String getHimg() {
		return himg;
	}
	public void setHimg(String himg) {
		this.himg = himg;
	}
	public String getHspecial() {
		return hspecial;
	}
	public void setHspecial(String hspecial) {
		this.hspecial = hspecial;
	}
	public String getHzipcode() {
		return hzipcode;
	}
	public void setHzipcode(String hzipcode) {
		this.hzipcode = hzipcode;
	}
	public String getHaddr() {
		return haddr;
	}
	public void setHaddr(String haddr) {
		this.haddr = haddr;
	}
	public String getHaddr2() {
		return haddr2;
	}
	public void setHaddr2(String haddr2) {
		this.haddr2 = haddr2;
	}
	public String getHlevel() {
		return hlevel;
	}
	public void setHlevel(String hlevel) {
		this.hlevel = hlevel;
	}
	public String getHvisit() {
		return hvisit;
	}
	public void setHvisit(String hvisit) {
		this.hvisit = hvisit;
	}
	public String getHtime() {
		return htime;
	}
	public void setHtime(String htime) {
		this.htime = htime;
	}
	public String getHholiday() {
		return hholiday;
	}
	public void setHholiday(String hholiday) {
		this.hholiday = hholiday;
	}
	public Date getHwriterdt() {
		return hwriterdt;
	}
	public void setHwriterdt(Date hwriterdt) {
		this.hwriterdt = hwriterdt;
	}
	public String getHlocation() {
		return hlocation;
	}
	public void setHlocation(String hlocation) {
		this.hlocation = hlocation;
	}
	public Date getHregdate() {
		return hregdate;
	}
	public void setHregdate(Date hregdate) {
		this.hregdate = hregdate;
	}
	public String getHmapx() {
		return hmapx;
	}
	public void setHmapx(String hmapx) {
		this.hmapx = hmapx;
	}
	public String getHmapy() {
		return hmapy;
	}
	public void setHmapy(String hmapy) {
		this.hmapy = hmapy;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public String getHurl() {
		return hurl;
	}
	public void setHurl(String hurl) {
		this.hurl = hurl;
	}
	public int getHreplycnt() {
		return hreplycnt;
	}
	public void setHreplycnt(int hreplycnt) {
		this.hreplycnt = hreplycnt;
	}
	public int getHviewcnt() {
		return hviewcnt;
	}
	public void setHviewcnt(int hviewcnt) {
		this.hviewcnt = hviewcnt;
	}
	public String getHlink() {
		return hlink;
	}
	public void setHlink(String hlink) {
		this.hlink = hlink;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	@Override
	public String toString() {
		return "HouseDto [hno=" + hno + ", hnm=" + hnm + ", hcontent=" + hcontent + ", hkind=" + hkind + ", hphone="
				+ hphone + ", hmenu=" + hmenu + ", hdetail=" + hdetail + ", himg=" + himg + ", hspecial=" + hspecial
				+ ", hzipcode=" + hzipcode + ", haddr=" + haddr + ", haddr2=" + haddr2 + ", hlevel=" + hlevel
				+ ", hvisit=" + hvisit + ", htime=" + htime + ", hholiday=" + hholiday + ", hwriterdt=" + hwriterdt
				+ ", hlocation=" + hlocation + ", hregdate=" + hregdate + ", hmapx=" + hmapx + ", hmapy=" + hmapy
				+ ", files=" + Arrays.toString(files) + ", hurl=" + hurl + ", hreplycnt=" + hreplycnt + ", hviewcnt="
				+ hviewcnt + ", hlink=" + hlink + ", fullName=" + fullName + "]";
	}
	
	
	
	
	
	
	
	
}
