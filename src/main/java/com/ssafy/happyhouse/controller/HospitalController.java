package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.CovidTestCenterDto;
import com.ssafy.happyhouse.dto.SafetyHospitalDto;
import com.ssafy.happyhouse.service.HospitalService;

@RequestMapping("/hospital")
@RestController
public class HospitalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	HospitalService hservice;
	
	@GetMapping("/safety/{no}")
	public List<SafetyHospitalDto> safety(@PathVariable("no") String no){
		List<SafetyHospitalDto> hList = null;
		try {
			hList = hservice.getSafetyHospitalList(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hList;
	}
	
	@GetMapping("/covid/{no}")
	public List<CovidTestCenterDto> covid(@PathVariable("no") String no){
		List<CovidTestCenterDto> cList = null;
		try {
			cList = hservice.getCovidTestCenterList(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
}
