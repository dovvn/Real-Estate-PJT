package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.SafetyHospitalDto;

public interface SafetyHospitalMapper {
	public List<SafetyHospitalDto> getSafetyHospitalList(String houseinfoId);
}
