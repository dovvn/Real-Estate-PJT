package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.CovidTestCenterDto;
import com.ssafy.happyhouse.dto.SafetyHospitalDto;

public interface HospitalService {
	List<SafetyHospitalDto> getSafetyHospitalList(String houseinfoId);
	List<CovidTestCenterDto> getCovidTestCenterList(String houseinfoId);
}
