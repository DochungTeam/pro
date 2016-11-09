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
	private String haddr;
	private String hlevel;
	private String hvisit;
	private String htime;
	private String hholiday;
	private String zipbunho;
	private Date hwriterdt;
	private Date hregdate;
	private String hlocation;
	private int hmapx;
	private int hmapy;
	private String[] files;
	
	public String getHaddr() {
		return haddr;
	}
	public void setHaddr(String haddr) {
		this.haddr = haddr;
	}
	public int getHmapx() {
		return hmapx;
	}
	public void setHmapx(int hmapx) {
		this.hmapx = hmapx;
	}
	public int getHmapy() {
		return hmapy;
	}
	public void setHmapy(int hmapy) {
		this.hmapy = hmapy;
	}
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
	public String gethaddr() {
		return haddr;
	}
	public void sethaddr(String haddr) {
		this.haddr = haddr;
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
	public String getZipbunho() {
		return zipbunho;
	}
	public void setZipbunho(String zipbunho) {
		this.zipbunho = zipbunho;
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
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "HouseDto [hno=" + hno + ", hnm=" + hnm + ", hcontent=" + hcontent + ", hkind=" + hkind + ", hphone="
				+ hphone + ", hmenu=" + hmenu + ", hdetail=" + hdetail + ", himg=" + himg + ", hspecial=" + hspecial
				+ ", haddr=" + haddr + ", hlevel=" + hlevel + ", hvisit=" + hvisit + ", htime=" + htime + ", hholiday="
				+ hholiday + ", zipbunho=" + zipbunho + ", hwriterdt=" + hwriterdt + ", hregdate=" + hregdate
				+ ", hlocation=" + hlocation + ", hmapx=" + hmapx + ", hmapy=" + hmapy + ", files="
				+ Arrays.toString(files) + "]";
	}
		
	
	
	
}
