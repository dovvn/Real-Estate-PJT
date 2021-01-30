package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.InterestDto;

public interface InterestService {
	boolean setInterest(InterestDto dto); //찜하기 등록
	boolean deleteInterest(InterestDto dto); // 찜하기 삭제
	List<InterestDto> getInterest(String userid); //찜하기 리스트 가져오기
	public InterestDto chkInterest(InterestDto dto);
}
