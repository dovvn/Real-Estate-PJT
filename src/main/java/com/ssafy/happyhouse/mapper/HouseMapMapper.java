package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.HouseInfoDto;
import com.ssafy.happyhouse.dto.SidoGugunCodeDto;

public interface HouseMapMapper {
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<HouseDealDto> getDealInfo() throws Exception;
	HouseDealDto getDealInfoOne(int no) throws Exception;
	List<HouseDealDto> getDealInfoByAptName(String aptName) throws Exception;
	List<HouseDealDto> getDealInfoByDong(String dong) throws Exception;
}
