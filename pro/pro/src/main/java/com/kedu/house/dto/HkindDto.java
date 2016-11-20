package com.kedu.house.dto;

public class HkindDto {

	private String hkind;
	private String kindname;
	private String kinddesc;
	public String getHkind() {
		return hkind;
	}
	public void setHkind(String hkind) {
		this.hkind = hkind;
	}
	public String getKindname() {
		return kindname;
	}
	public void setKindname(String kindname) {
		this.kindname = kindname;
	}
	public String getKinddesc() {
		return kinddesc;
	}
	public void setKinddesc(String kinddesc) {
		this.kinddesc = kinddesc;
	}
	@Override
	public String toString() {
		return "HkindDto [hkind=" + hkind + ", kindname=" + kindname + ", kinddesc=" + kinddesc + "]";
	}
	
	
}
