package com.ssafy.happyhouse.mapper;

import java.util.List;

import com.ssafy.happyhouse.dto.QnaDto;

public interface QnaMapper {
	//질문 검색
	public List<QnaDto> searchTitle(String keyword);
	public List<QnaDto> searchContent(String keyword);
	public List<QnaDto> searchWriter(String keyword);
		
	public List<QnaDto> getBoardList(); //전체 질문 목록
	public boolean delete(int bnum); //질문 삭제
	public QnaDto getBoard(int bnum); //질문 상세
	public boolean update(QnaDto dto); //질문 수정
	public boolean write(QnaDto dto); //질문 작성
	public void updateReadcnt(int bnum); //조회수 증가
	
	public boolean ansWrite(QnaDto dto); //답변 작성
	public boolean ansUpdate(QnaDto dto); //답변 수정
	public boolean ansDelete(int bnum); //답변 삭제
	public List<QnaDto> getAnsList(int questionnum);
	public List<QnaDto> getFAQList(); //FAQ 목록
}
