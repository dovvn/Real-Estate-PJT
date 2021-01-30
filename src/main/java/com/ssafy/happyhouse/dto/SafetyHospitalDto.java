package com.ssafy.happyhouse.dto;

public class SafetyHospitalDto {
	private int no;
	private String validDate; // 유효 날짜
	private String city; // 도시
	private String gugun; // 구군
	private String hospitalName; // 병원 이름
	private String address; // 주소
	private String diagnosisType; // 진단 타입
	private String phone; // 전화번호

	public SafetyHospitalDto() {

	}

	public SafetyHospitalDto(String validDate, String city, String gugun, String hospitalName, String address,
			String diagnosisType, String phone) {
		super();
		this.validDate = validDate;
		this.city = city;
		this.gugun = gugun;
		this.hospitalName = hospitalName;
		this.address = address;
		this.diagnosisType = diagnosisType;
		this.phone = phone;
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

	public String getDiagnosisType() {
		return diagnosisType;
	}

	public void setDiagnosisType(String diagnosisType) {
		this.diagnosisType = diagnosisType;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "SafetyHospitalDto [validDate=" + validDate + ", city=" + city + ", gugun=" + gugun + ", hospitalName="
				+ hospitalName + ", address=" + address + ", diagnosisType=" + diagnosisType + ", phone=" + phone + "]";
	}

}
