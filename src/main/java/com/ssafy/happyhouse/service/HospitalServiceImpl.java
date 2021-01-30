package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.CovidTestCenterDto;
import com.ssafy.happyhouse.dto.SafetyHospitalDto;
import com.ssafy.happyhouse.mapper.CovidTestCenterMapper;
import com.ssafy.happyhouse.mapper.SafetyHospitalMapper;

@Service
public class HospitalServiceImpl implements HospitalService {
	@Autowired
	SqlSession dao;
	
	@Override
	public List<SafetyHospitalDto> getSafetyHospitalList(String houseinfoId) {
		return dao.getMapper(SafetyHospitalMapper.class).getSafetyHospitalList(houseinfoId);
	}

	@Override
	public List<CovidTestCenterDto> getCovidTestCenterList(String houseinfoId) {
		return dao.getMapper(CovidTestCenterMapper.class).getCovidTestCenterList(houseinfoId);
	}

}
