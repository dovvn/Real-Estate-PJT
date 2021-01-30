package com.ssafy.happyhouse.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssafy.happyhouse.dto.NoticeDto;

public interface NoticeMapper {
	public int selectTotalCount(); //글 조회수 가져오기
	public List<NoticeDto> selectPage(HashMap<String, Integer> map); //페이지 한개 가져오기
	public int write(NoticeDto dto); //글쓰기
	public void updateReadcnt(int bnum); //조회수 업데이트
	public NoticeDto selectBoard(int bnum); //게시글 선택
	public int update(NoticeDto dto); //게시글 수정
	public int delete(int bnum); //게시글 삭제
	public List<NoticeDto> searchTitle(String title); //제목으로 검색
	public List<NoticeDto> searchContent(String keyword); //내용으로 검색
	public List<NoticeDto> searchWriter(String keyword); //글쓴이로 검색
}
