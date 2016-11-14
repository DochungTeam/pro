package com.kedu.house.dto;

public class ImageDto {

	private String title;
	private String link;
	private String thumbnail;
	private int sizeheight;
	private int sizewidth;
	
	public ImageDto(String title,String link,String thumbnail,int sizeheight,int sizewidth) {
		super();
		
		this.title=title;
		this.link=link;
		this.thumbnail=thumbnail;
		this.sizeheight=sizeheight;
		this.sizewidth=sizewidth;
	}
	@Override
	public String toString() {
		return "ImageDto [title=" + title + ", link=" + link + ", thumbnail=" + thumbnail + ", sizeheight=" + sizeheight
				+ ", sizewidth=" + sizewidth + "]";
	}
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
	public int getSizeheight() {
		return sizeheight;
	}
	public void setSizeheight(int sizeheight) {
		this.sizeheight = sizeheight;
	}
	public int getSizewidth() {
		return sizewidth;
	}
	public void setSizewidth(int sizewidth) {
		this.sizewidth = sizewidth;
	}
	
	
	
}
