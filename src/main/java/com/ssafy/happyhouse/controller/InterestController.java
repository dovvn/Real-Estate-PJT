package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.InterestDto;
import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.HouseMapService;
import com.ssafy.happyhouse.service.InterestService;

@RequestMapping("/interest")
@Controller
public class InterestController {
	@Autowired
	InterestService iservice;
	@Autowired
	HouseMapService hservice;
	
	// 찜하기 페이지 이동
	@GetMapping("")
	private String gotoInterestList(Model model, HttpSession session) {
		model.addAttribute("interList", getInterestList(session));
		return "interestList";
	}
	
	@GetMapping("/list")
	@ResponseBody
	private List<InterestDto> getInterestList(HttpSession session){
		List<InterestDto> interList = new ArrayList<>();
		MemberDto dto = (MemberDto) session.getAttribute("loginInfo");
		if(dto == null) return null;
		
		String userid = dto.getUserid();
		try {
			interList = iservice.getInterest(userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return interList;
	}

	// 찜하기 등록
	@GetMapping("/{no}")
	@ResponseBody
	private void setInterest(@PathVariable("no") int no, HttpSession session) throws IOException {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		String userid = loginInfo.getUserid();

		iservice.setInterest(new InterestDto(userid, no));
	}
	
	// 찜하기 취소
	@DeleteMapping("/{no}")
	@ResponseBody
	private void deleteInterest(@PathVariable("no") int no, HttpSession session) throws IOException {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		String userid = loginInfo.getUserid();

		iservice.deleteInterest(new InterestDto(userid, no));
	}
	
	// 찜한 매물인지 확인
	@GetMapping("/chk/{no}")
	@ResponseBody
	private String chkInterest(@PathVariable("no") int no, HttpSession session) {
		InterestDto dto = new InterestDto();
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		String userid = loginInfo.getUserid();
		
		dto.setUserid(userid);
		dto.setNo(no);
		if(iservice.chkInterest(dto) != null) {
			return "true";
		}
		return "false";
	}
	
	//매물 정보 디테일 가져오기
	@GetMapping("/detail/{no}")
	@ResponseBody
	private HouseDealDto detail(@PathVariable("no") int no) {
		HouseDealDto dto = null;
		try {
			dto = hservice.getDealInfo(no);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


}
