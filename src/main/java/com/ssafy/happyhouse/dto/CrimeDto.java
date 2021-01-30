package com.ssafy.happyhouse.dto;

public class CrimeDto {
	private String gu; //구
	private int crime_rate; //범죄율
	private int murder; //살인
	private int robbery; //강도
	private int harassment; //추행
	private int theft; //절도
	private int violence; //폭력
	private int safety_level; //치안안전등급
	
	public CrimeDto() {}
	
	public CrimeDto(String gu, int crime_rate, int murder, int robbery, int harassment, int theft, int violence) {
		super();
		this.gu = gu;
		this.crime_rate = crime_rate;
		this.murder = murder;
		this.robbery = robbery;
		this.harassment = harassment;
		this.theft = theft;
		this.violence = violence;
	}
	
	public CrimeDto(String gu, int crime_rate, int murder, int robbery, int harassment, int theft, int violence,
			int safety_level) {
		super();
		this.gu = gu;
		this.crime_rate = crime_rate;
		this.murder = murder;
		this.robbery = robbery;
		this.harassment = harassment;
		this.theft = theft;
		this.violence = violence;
		this.safety_level = safety_level;
	}
	
	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public int getCrime_rate() {
		return crime_rate;
	}
	public void setCrime_rate(int crime_rate) {
		this.crime_rate = crime_rate;
	}
	public int getMurder() {
		return murder;
	}
	public void setMurder(int murder) {
		this.murder = murder;
	}
	public int getRobbery() {
		return robbery;
	}
	public void setRobbery(int robbery) {
		this.robbery = robbery;
	}
	public int getHarassment() {
		return harassment;
	}
	public void setHarassment(int harassment) {
		this.harassment = harassment;
	}
	public int getTheft() {
		return theft;
	}
	public void setTheft(int theft) {
		this.theft = theft;
	}
	public int getViolence() {
		return violence;
	}
	public void setViolence(int violence) {
		this.violence = violence;
	}
	public int getSafety_level() {
		return safety_level;
	}
	public void setSafety_level(int safety_level) {
		this.safety_level = safety_level;
	}

	@Override
	public String toString() {
		return "CrimeDto [gu=" + gu + ", crime_rate=" + crime_rate + ", murder=" + murder + ", robbery=" + robbery
				+ ", harassment=" + harassment + ", theft=" + theft + ", violence=" + violence + ", safety_level="
				+ safety_level + "]";
	}
}
