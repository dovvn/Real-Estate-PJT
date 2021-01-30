package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.CrimeDaoImpl;
import com.ssafy.happyhouse.dto.CrimeDto;

@Service
public class CrimeServiceImpl implements CrimeService{
	@Autowired
	CrimeDaoImpl cdao;
	
	public List<CrimeDto> getCrimeList(){
		return cdao.getCrimeList();
	}
}
