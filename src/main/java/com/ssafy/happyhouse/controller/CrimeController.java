package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.CrimeDto;
import com.ssafy.happyhouse.service.CrimeService;

@RequestMapping("/crime")
@RestController
public class CrimeController {
	@Autowired
	CrimeService cservice;
	
	@GetMapping("")
	public List<CrimeDto> crime(){
		List<CrimeDto> crimeList = null;
		try {
			crimeList = cservice.getCrimeList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return crimeList;
	}
}
