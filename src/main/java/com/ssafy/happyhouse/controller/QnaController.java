package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.dto.QnaDto;
import com.ssafy.happyhouse.service.QnaService;

@Controller
@RequestMapping("/qna")
@CrossOrigin(origins = "*")
public class QnaController {
	@Autowired
	QnaService qService;

	//뷰 페이지 보여주기
	@GetMapping("")
	public String qnaView() {
		return "qna";
	}

	// 전체 질문 목록
	@GetMapping("/list")
	@ResponseBody
	private List<QnaDto> qnaList() {
		return qService.getBoardList();
	}
	
	// 질문 상세보기
	@GetMapping("/{bnum}")
	@ResponseBody
	private QnaDto read(@PathVariable("bnum") int bnum) {
		return qService.getBoard(bnum);
	}
	
	// 질문 작성
	@PostMapping("")
	@ResponseBody
   	public boolean addEmployee(@RequestBody QnaDto dto, HttpSession session) throws Exception {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		dto.setUserid(loginInfo.getUserid());
		return qService.write(dto);
	}
	
	// 질문 수정
	@PutMapping("")
	@ResponseBody
	private boolean qnaUpdate(@RequestBody QnaDto dto)
			throws IOException {
		return qService.update(dto);
	}
	
	// 질문 삭제
	@DeleteMapping("/{bnum}")
	@ResponseBody
	private boolean delete(@PathVariable("bnum") int bnum) {
		return qService.delete(bnum);
	}
	
	// 질문 검색
	@GetMapping("/{type}/{word}")
	@ResponseBody
	private List<QnaDto> search(@PathVariable("type") String type,
			@PathVariable("word") String keyword) {	
		List<QnaDto> resultList = null;
		if (type.equals("btitle")) { // 이름으로 검색
			resultList = qService.searchTitle("%" + keyword + "%");
		} else if (type.equals("bcontent")) { // 내용으로 검색
			resultList = qService.searchContent("%" + keyword + "%");
		} else if (type.equals("userid")) {// 작성자로 검색
			resultList = qService.searchWriter("%" + keyword + "%");
		}
		return resultList;
	}

	//답변 작성
	@PostMapping("/ans")
	@ResponseBody
   	public boolean addAnswer(@RequestBody QnaDto dto, HttpSession session) throws Exception {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		dto.setBtitle("reply");
		dto.setUserid(loginInfo.getUserid());
		return qService.ansWrite(dto);
	}
	
	//답변 수정
	@PutMapping("/ans")
	@ResponseBody
	private boolean ansUpdate(@RequestBody QnaDto dto)
			throws IOException {
		return qService.ansUpdate(dto);
	}
	
	//답변 삭제
	@DeleteMapping("/ans/{bnum}")
	@ResponseBody
	private boolean ansDelete(@PathVariable("bnum") int bnum) {
		return qService.ansDelete(bnum);
	}
	
	//답변 목록
	@GetMapping("/ans/{qnum}")
	@ResponseBody
	private List<QnaDto> ansList(@PathVariable("qnum") int questionnum) {
		return qService.getAnsList(questionnum);
	}
	
	// 질문 목록
	@GetMapping("/faq")
	@ResponseBody
	private List<QnaDto> getFAQList() {
		return qService.getFAQList();
	}
}
