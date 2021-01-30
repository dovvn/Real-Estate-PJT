package com.ssafy.happyhouse.dto;

public class InterestDto {
	private String userid; //사용자 아이디
	private int no; //매물번호
	private String area; //지역
	private String floor; //층
	private String dealAmount; //월세
	private String aptName; //아파트이름
	private String img; //이미지

	public InterestDto() {}
	
	public InterestDto(String userid, int no) {
		super();
		this.userid = userid;
		this.no = no;
	}

	public InterestDto(String userid, int deal_id, String area, String floor, String dealAmount, String aptName) {
		this.userid = userid;
		this.no = deal_id;
		this.area = area;
		this.floor = floor;
		this.dealAmount = dealAmount;
		this.aptName = aptName;
	}
	
	public InterestDto(String userid, int no, String area, String floor, String dealAmount, String aptName,
			String img) {
		super();
		this.userid = userid;
		this.no = no;
		this.area = area;
		this.floor = floor;
		this.dealAmount = dealAmount;
		this.aptName = aptName;
		this.img = img;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int deal_id) {
		this.no = deal_id;
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
	public String getDealAmount() {
		return dealAmount;
	}
	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}
	public String getAptName() {
		return aptName;
	}
	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "InterestDto [userid=" + userid + ", no=" + no + ", area=" + area + ", floor=" + floor + ", dealAmount="
				+ dealAmount + ", aptName=" + aptName + ", img=" + img + "]";
	}
	
}
