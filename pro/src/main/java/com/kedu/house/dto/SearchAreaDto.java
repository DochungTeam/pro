package com.kedu.house.dto;

public class SearchAreaDto {
	private String sido;
	private String sigungu;
	private String dong;
	
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	@Override
	public String toString() {
		return "SearchAreaDto [sido=" + sido + ", sigungu=" + sigungu + ", dong=" + dong + "]";
	}
}
