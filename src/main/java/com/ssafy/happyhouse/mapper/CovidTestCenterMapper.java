package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.CovidTestCenterDto;

public interface CovidTestCenterMapper {
	public List<CovidTestCenterDto> getCovidTestCenterList(String houseinfoId);
}
