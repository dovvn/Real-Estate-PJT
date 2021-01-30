package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.CommentDto;
import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.dto.NoticeDto;
import com.ssafy.happyhouse.dto.NoticePageDto;

@Service
public interface NoticeService {
	public int update(NoticeDto board); //공지 수정
	public int delete(int bnum); //공지 삭제
	public List<NoticeDto> searchTitle(String title); //이름으로 검색
	public List<NoticeDto> searchContent(String keyword); //내용으로 검색
	public List<NoticeDto> searchWriter(String keyword); //글쓴이로 검색
	public NoticePageDto makePage(int curPage); //한페이지 만들기
	public NoticeDto getBoard(int bnum);//상세페이지 가져오기
	public int write(NoticeDto dto); //글쓰기
	public List<CommentDto> getCommentList(int bnum); //댓글 전체 목록
	boolean writeComment(int bnum, String content, MemberDto loginInfo); //댓글 작성
	void deleteComment(CommentDto dto);
}
