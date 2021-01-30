package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.dto.InterestDto;
import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.InterestService;

@Controller
public class HomeController {
	@Autowired
	private InterestService iservice;
	
	@GetMapping("introduction.do")
	public String getComment() {
		return "introduction";
	}
	
	//홈으로
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		if(loginInfo != null) {
			String userid = loginInfo.getUserid();
			List<InterestDto> interList = iservice.getInterest(userid);
			model.addAttribute("interList", interList);
		}
		return "index";
	}
}
