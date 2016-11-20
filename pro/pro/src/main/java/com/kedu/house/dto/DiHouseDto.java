package com.kedu.house.dto;


public class DiHouseDto {
	private int hno;
	private String title;
	private String telephone;
	private String category;
	private String link;
	private String description;
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	private String address;
	private String lastbuilddate;
	private int mapx;
	private int mapy;

	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public void setLastbuilddate(String lastbuilddate) {
		this.lastbuilddate = lastbuilddate;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public int getMapx() {
		return mapx;
	}
	public void setMapx(int mapx) {
		this.mapx = mapx;
	}
	public int getMapy() {
		return mapy;
	}
	public void setMapy(int mapy) {
		this.mapy = mapy;
	}
	@Override
	public String toString() {
		return "DiHouseDto [hno=" + hno + ", title=" + title + ", telephone=" + telephone + ", category=" + category
				+ ", link=" + link + ", description=" + description + ", address=" + address + ", lastbuilddate="
				+ lastbuilddate + ", mapx=" + mapx + ", mapy=" + mapy + "]";
	}
	
	
}
