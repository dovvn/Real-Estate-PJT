package com.ssafy.happyhouse.dto;

public class HouseDealDto {
	int dealId; // 거래 정보 아이디
	int no; // 주택 정보 아이디
	String dong; // 동
	String aptName; // 아파트 이름
	String jibun; // 지번
	String lat; // 위도
	String lng; // 경도
	String dealAmount; // 가격
	String dealYear; // 거래 년도
	String dealMonth; // 거래 월
	String dealDay; // 거래 일
	String area; // 면적
	String floor; // 층
	String type; // 매매, 전월세
	String rentMoney; // 전월세
	String img; // 이미지 경로

	public HouseDealDto() {}

	public HouseDealDto(int dealId, int houseinfoId, String dong, String aptName, String jibun, String lat, String lng,
			String dealAmount, String dealYear, String dealMonth, String dealDay, String area, String floor,
			String type, String rentMoney, String img) {
		super();
		this.dealId = dealId;
		this.no = houseinfoId;
		this.dong = dong;
		this.aptName = aptName;
		this.jibun = jibun;
		this.lat = lat;
		this.lng = lng;
		this.dealAmount = dealAmount;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.area = area;
		this.floor = floor;
		this.type = type;
		this.rentMoney = rentMoney;
		this.img = img;
	}

	public int getDealId() {
		return dealId;
	}

	public void setDealId(int dealId) {
		this.dealId = dealId;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int houseinfoId) {
		this.no = houseinfoId;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public String getDealYear() {
		return dealYear;
	}

	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}

	public String getDealMonth() {
		return dealMonth;
	}

	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}

	public String getDealDay() {
		return dealDay;
	}

	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRentMoney() {
		return rentMoney;
	}

	public void setRentMoney(String rentMoney) {
		this.rentMoney = rentMoney;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "HouseDealDto [dealId=" + dealId + ", houseinfoId=" + no + ", dong=" + dong + ", aptName="
				+ aptName + ", jibun=" + jibun + ", lat=" + lat + ", lng=" + lng + ", dealAmount=" + dealAmount
				+ ", dealYear=" + dealYear + ", dealMonth=" + dealMonth + ", dealDay=" + dealDay + ", area=" + area
				+ ", floor=" + floor + ", type=" + type + ", rentMoney=" + rentMoney + ", img=" + img + "]";
	}

}
