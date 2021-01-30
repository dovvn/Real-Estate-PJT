package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.HouseInfoDto;
import com.ssafy.happyhouse.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.mapper.HouseMapMapper;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	@Autowired
	SqlSession dao;
	
	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return dao.getMapper(HouseMapMapper.class).getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return dao.getMapper(HouseMapMapper.class).getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return dao.getMapper(HouseMapMapper.class).getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return dao.getMapper(HouseMapMapper.class).getAptInDong(dong);
	}
	
	@Override
	public List<HouseDealDto> getDealInfo() throws Exception{
		return dao.getMapper(HouseMapMapper.class).getDealInfo();
	}
	
	@Override
	public HouseDealDto getDealInfo(int no) throws Exception{
		return dao.getMapper(HouseMapMapper.class).getDealInfoOne(no);
	}

	@Override
	public List<HouseDealDto> getDealInfoByAptName(String aptName) throws Exception {
		// 아파트 이름으로 거래 정보 가져오기
		return dao.getMapper(HouseMapMapper.class).getDealInfoByAptName(aptName);
	}

	@Override
	public List<HouseDealDto> getDealInfoByDong(String dong) throws Exception {
		// 동 이름으로 거래 정보 가져오기
		return dao.getMapper(HouseMapMapper.class).getDealInfoByDong(dong);
	}

	@Override
	public List<HouseDealDto> sortDealInfo(List<HouseDealDto> data, String sortType) throws Exception {
		// sort type에 따라 데이터 정렬 
		if(sortType.equals("price")) { // 가격 기준으로 정렬
			data.sort((HouseDealDto d1, HouseDealDto d2) -> d1.getDealAmount().compareTo(d2.getDealAmount()));
		} else if(sortType.equals("area")) { // 면적 기준으로 정렬
			data.sort((HouseDealDto d1, HouseDealDto d2) -> Float.compare(Float.parseFloat(d1.getArea()), Float.parseFloat(d2.getArea())));
		} else if(sortType.equals("floor")) { // 층을 기준으로 정렬
			data.sort((HouseDealDto d1, HouseDealDto d2) -> Integer.compare(Integer.parseInt(d1.getFloor()), Integer.parseInt(d2.getFloor())));
		}
		return data;
	}
	
	
}
