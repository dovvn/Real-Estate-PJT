package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.dto.NoticeDto;
import com.ssafy.happyhouse.dto.NoticePageDto;
import com.ssafy.happyhouse.service.NoticeService;


@Controller
public class NoticeController{
	@Autowired
	private NoticeService nservice;

	//글 검색하기
	@PostMapping("noticeSearch.do") 
	private String search(String search_type, String keyword, Model model) {
		List<NoticeDto> resultList = null;
		String typeName = null;
		if(search_type.equals("btitle")){ //이름으로 검색
			typeName = "제목";
			resultList = nservice.searchTitle("%"+keyword+"%");
		}else if(search_type.equals("bcontent")){ //내용으로 검색
			typeName = "내용";
			resultList = nservice.searchContent("%"+keyword+"%");
		}else if(search_type.equals("userid")){//작성자로 검색
			typeName = "작성자";
			resultList = nservice.searchWriter("%"+keyword+"%");
		}
		model.addAttribute("typeName", typeName);
		model.addAttribute("keyword", keyword);
		model.addAttribute("resultList", resultList);
		return "noticeSearch";
	}

	// 글삭제하기
	@GetMapping("noticeDelete.do") 
	private String delete(int bnum, Model model) {
		System.out.println(bnum);
		nservice.delete(bnum);
		return noticeList("1", model);
	}
	
	//글 수정페이지 이동
	@GetMapping("noticeUpdate.do") 
	private String noticeUpdate(int bnum, Model model) throws IOException {
		NoticeDto dto = nservice.getBoard(bnum);
		model.addAttribute("dto", dto);	
		return "noticeUpdate";
	}

	//글 수정하기
	@PostMapping("noticeUpdate.do") 
	private String noticeUpdate(NoticeDto dto, HttpSession session, HttpServletResponse resp, Model model) throws IOException {
		nservice.update(dto);
		return read(dto.getBnum(), model);
	}

	//글 상세보기
	@GetMapping("noticeRead.do") 
	private String read(int bnum, Model model) {
		NoticeDto dto = nservice.getBoard(bnum);
		model.addAttribute("dto", dto);	
		return "noticeRead";
	}

	//글작성 페이지 이동
	@GetMapping("noticeWrite.do") 
	private String noticeWritePage() {
		return "noticeWrite";
	}
		
	//글작성하기
	@PostMapping("noticeWrite.do") 
	private String write(NoticeDto dto, HttpSession session, Model model) {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		dto.setUserid(loginInfo.getUserid());
		nservice.write(dto);
		return noticeList("1", model);
	}

	//전체 목록 보기
	@GetMapping("noticeList.do") 
	private String noticeList(String pageStr, Model model) {
		// 모든 도서 목록 보기 기능
		int page = 1; // 기본 1페이지
		if (pageStr != null && pageStr.length() > 0) { //다음 페이지 클릭시
			page = Integer.parseInt(pageStr);
		}

		NoticePageDto pageDto = nservice.makePage(page); //현재 페이지 정보
		model.addAttribute("pageDto", pageDto);
		return "noticeList";
	}
}
