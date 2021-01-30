package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.service.HouseMapService;

@Controller
public class HouseSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	HouseMapService hmService;
	
	@GetMapping("/search")
	public String search(Model model) {
		List<HouseDealDto> dealList = new ArrayList<>();
		try {
			dealList = hmService.getDealInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("dealList", dealList);
		return "search";
	}
	
	@PostMapping("/search")
	public String search(String sido, String gugun, String dong, String aptName, 
			String houseType,String sortType, Model model) {

		List<HouseDealDto> dealList = new ArrayList<>();
		
		// 검색
		if(aptName != null && aptName.length() > 0) { // 아파트 이름으로 검색
			try {
				dealList = hmService.getDealInfoByAptName(aptName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(dong != null && dong.length() > 0) { // 동으로 검색
			try {
				dealList = hmService.getDealInfoByDong(dong);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				dealList = hmService.getDealInfo();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 정렬
		if(dealList != null && dealList.size() > 0 && sortType != null && sortType.length() > 0) {
			try {
				hmService.sortDealInfo(dealList, sortType);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("dealList", dealList);
		return "search";
	}	
}
