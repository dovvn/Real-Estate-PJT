package com.ssafy.happyhouse.dto;

public class CovidTestCenterDto {
	private int no;
	private String validDate; // 유효 날짜
	private String city; // 도시
	private String gugun; // 구군
	private String hospitalName; // 병원 이름
	private String address; // 주소
	private String phone; // 전화번호
	private String weekTime; // 주중 운영 시간
	private String saturdayTime; // 토요일 운영 시간
	private String holidayTime; // 주말 운영 시간

	public CovidTestCenterDto() {}

	public CovidTestCenterDto(String validDate, String city, String gugun, String hospital_name, String address,
			String phone, String weekTime, String saturdayTime, String holidayTime) {
		this.validDate = validDate;
		this.city = city;
		this.gugun = gugun;
		this.hospitalName = hospital_name;
		this.address = address;
		this.phone = phone;
		this.weekTime = weekTime;
		this.saturdayTime = saturdayTime;
		this.holidayTime = holidayTime;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getValidDate() {
		return validDate;
	}

	public void setValidDate(String validDate) {
		this.validDate = validDate;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWeekTime() {
		return weekTime;
	}

	public void setWeekTime(String weekTime) {
		this.weekTime = weekTime;
	}

	public String getSaturdayTime() {
		return saturdayTime;
	}

	public void setSaturdayTime(String saturdayTime) {
		this.saturdayTime = saturdayTime;
	}

	public String getHolidayTime() {
		return holidayTime;
	}

	public void setHolidayTime(String holidayTime) {
		this.holidayTime = holidayTime;
	}

	@Override
	public String toString() {
		return "CovidTestCenterDto [validDate=" + validDate + ", city=" + city + ", gugun=" + gugun + ", hospitalName="
				+ hospitalName + ", address=" + address + ", phone=" + phone + ", weekTime=" + weekTime
				+ ", saturdayTime=" + saturdayTime + ", holidayTime=" + holidayTime + "]";
	}

}
