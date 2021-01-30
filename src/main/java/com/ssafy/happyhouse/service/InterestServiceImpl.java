package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.InterestDto;
import com.ssafy.happyhouse.mapper.InterestMapper;

@Service
public class InterestServiceImpl implements InterestService{
	@Autowired
	SqlSession dao;
	
	@Override
	public boolean setInterest(InterestDto dto) {
		try {
			dao.getMapper(InterestMapper.class).setInterest(dto);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteInterest(InterestDto dto) {
		try {
			dao.getMapper(InterestMapper.class).deleteInterest(dto);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public List<InterestDto> getInterest(String userid) {
		return dao.getMapper(InterestMapper.class).getInterest(userid);
	}
	
	@Override
	public InterestDto chkInterest(InterestDto dto) {
		return dao.getMapper(InterestMapper.class).chkInterest(dto);
	}
}
