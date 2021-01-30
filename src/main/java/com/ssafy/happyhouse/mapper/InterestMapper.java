package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.InterestDto;

public interface InterestMapper {
	public int setInterest(InterestDto dto);
	public int deleteInterest(InterestDto dto);
	public List<InterestDto> getInterest(String userid);
	public InterestDto chkInterest(InterestDto dto);
}
