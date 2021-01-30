package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ssafy.happyhouse.dto.CommentDto;
import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.NoticeService;

@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private NoticeService nservice;

	@GetMapping(value="", produces = "text/json; charset=utf8")
	public String getComment(int bnum) {
		List<CommentDto> commentList = nservice.getCommentList(bnum);
		Gson gs = new Gson();
		String result = gs.toJson(commentList);
		return result;
	}
	
	@DeleteMapping("/{cnum}")
	public void commentDelete( @PathVariable("cnum") int cnum, HttpSession session) {
		CommentDto dto = new CommentDto();
		dto.setCwriter(((MemberDto) session.getAttribute("loginInfo")).getUserid());
		dto.setCnum(cnum);
		
		nservice.deleteComment(dto);
	}
	
	@PostMapping("")
	public String postComment(int bnum, String content, HttpSession session) {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		if(loginInfo!=null && nservice.writeComment(bnum, content, loginInfo)) { // 로그인된 사람만 글 쓸수 있음.
			return "success";
		}else {
			return "fail";
		}
	}
}
