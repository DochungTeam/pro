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
	private String hwritedt;
	private String title;
	private String link;
	private String thumbnail;
	private String sizeheight;
	private String sizewidth;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getSizeheight() {
		return sizeheight;
	}
	public void setSizeheight(String sizeheight) {
		this.sizeheight = sizeheight;
	}
	public String getSizewidth() {
		return sizewidth;
	}
	public void setSizewidth(String sizewidth) {
		this.sizewidth = sizewidth;
	}
	public void setHwritedt(String hwritedt) {
		this.hwritedt = hwritedt;
	}
	private String hmapx;
	private String hmapy;
	private String hlink;
	private String[] files;
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public String getHwritedt() {
		return hwritedt;
	}
	public String getHlink() {
		return hlink;
	}
	public void setHlink(String hlink) {
		this.hlink = hlink;
	}
	public String getHaddr() {
		return haddr;
	}
	public void setHaddr(String haddr) {
		this.haddr = haddr;
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
	
	@Override
	public String toString() {
		return "HouseDto [hno=" + hno + ", hnm=" + hnm + ", hcontent=" + hcontent + ", hkind=" + hkind + ", hphone="
				+ hphone + ", hmenu=" + hmenu + ", hdetail=" + hdetail + ", himg=" + himg + ", hspecial=" + hspecial
				+ ", haddr=" + haddr + ", hlevel=" + hlevel + ", hvisit=" + hvisit + ", htime=" + htime + ", hholiday="
				+ hholiday + ", zipbunho=" + zipbunho + ", hwritedt=" + hwritedt + ", title=" + title + ", link=" + link
				+ ", thumbnail=" + thumbnail + ", sizeheight=" + sizeheight + ", sizewidth=" + sizewidth + ", hmapx="
				+ hmapx + ", hmapy=" + hmapy + ", hlink=" + hlink + ", files=" + Arrays.toString(files) + "]";
	}

	
	
}
