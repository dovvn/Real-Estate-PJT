package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.HouseInfoDto;
import com.ssafy.happyhouse.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.service.HouseMapService;

@Controller
@RequestMapping("/map")
public class HouseMapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	HouseMapService hmService;

	@GetMapping("/sido")
	@ResponseBody
	public List<SidoGugunCodeDto> sido(){
		List<SidoGugunCodeDto> sidoList = null;
		try {
			sidoList = hmService.getSido();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sidoList;
	}

	@GetMapping("/gugun/{sido}")
	@ResponseBody
	public List<SidoGugunCodeDto> gugun(@PathVariable("sido") String sido){
		List<SidoGugunCodeDto> gugunList = null;
		try {
			gugunList = hmService.getGugunInSido(sido);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gugunList;
	}
	
	@GetMapping("/dong/{gugun}")
	@ResponseBody
	public List<HouseInfoDto> dong(@PathVariable("gugun") String gugun){
		List<HouseInfoDto> dongList = null;
		try {
			dongList = hmService.getDongInGugun(gugun);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dongList;
	}
	
	
}