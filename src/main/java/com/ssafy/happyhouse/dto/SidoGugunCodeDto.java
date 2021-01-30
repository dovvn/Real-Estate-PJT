package com.ssafy.happyhouse.dto;

public class SidoGugunCodeDto {

	private String sido_code;
	private String sido_name;
	private String gugun_code;
	private String gugun_name;

	public SidoGugunCodeDto() {
	}

	public String getSidoCode() {
		return sido_code;
	}

	public void setSidoCode(String sidoCode) {
		this.sido_code = sidoCode;
	}

	public String getSidoName() {
		return sido_name;
	}

	public void setSidoName(String sidoName) {
		this.sido_name = sidoName;
	}

	public String getGugunCode() {
		return gugun_code;
	}

	public void setGugunCode(String gugunCode) {
		this.gugun_code = gugunCode;
	}

	public String getGugunName() {
		return gugun_name;
	}

	public void setGugunName(String gugunName) {
		this.gugun_name = gugunName;
	}

}
