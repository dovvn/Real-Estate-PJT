package com.ssafy.happyhouse.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.happyhouse.dto.CommentDto;
import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.dto.NoticeDto;
import com.ssafy.happyhouse.dto.NoticePageDto;
import com.ssafy.happyhouse.mapper.CommentMapper;
import com.ssafy.happyhouse.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int update(NoticeDto dto) {
		return sqlSession.getMapper(NoticeMapper.class).update(dto);
	}

	@Override
	public int delete(int bnum) {
		return sqlSession.getMapper(NoticeMapper.class).delete(bnum);
	}

	@Override
	public List<NoticeDto> searchTitle(String title) {
		return sqlSession.getMapper(NoticeMapper.class).searchTitle(title);
	}

	public static final int COUNT_PER_PAGE = 10; //한 페이지에 10개 글
	
	@Override
	public NoticePageDto makePage(int curPage) {
		int totalCnt = sqlSession.getMapper(NoticeMapper.class).selectTotalCount(); // 총 게시글 갯수 조회해서
		int totalPageCnt = totalCnt/COUNT_PER_PAGE; // 총 필요한 페이지수 계산(다음, 이전 링크 관련)
		if(totalCnt%COUNT_PER_PAGE>0) 
			totalPageCnt++;
		
		int startPage = (curPage-1)/10*10+1; // ex) 11
		int endPage = startPage+9; //ex) 20
		
		if(totalPageCnt<endPage) // 마지막 페이지가 15이니까 20으로 계산하면 안댐.
			endPage = totalPageCnt;
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("startRow", (curPage-1)*10); // 현재 페이지에 보여질 글 조회
		map.put("COUNT_PER_PAGE",COUNT_PER_PAGE);
		
		List<NoticeDto> noticeList = sqlSession.getMapper(NoticeMapper.class).selectPage(map);
		
		// 해당 게시글 dto에 댓글 갯수 첨부
		for(NoticeDto dto: noticeList) {
			int cmtCnt = sqlSession.getMapper(CommentMapper.class).selectCommentCount(dto.getBnum()); // 해당 게시글에 댓글이 몇개 달렸나 조회
			dto.setCmtCnt(cmtCnt); 
		}
		
		return new NoticePageDto(noticeList, curPage, startPage, endPage, totalPageCnt);
	}

	@Override
	public NoticeDto getBoard(int bnum) {
		sqlSession.getMapper(NoticeMapper.class).updateReadcnt(bnum); // 읽기전에 조회수부터 증가 시키고
		return sqlSession.getMapper(NoticeMapper.class).selectBoard(bnum); // 글 꺼내기
	}
	
	@Override
	public int write(NoticeDto dto) {
		return sqlSession.getMapper(NoticeMapper.class).write(dto);
	}


	@Override
	public List<NoticeDto> searchContent(String keyword) {
		return sqlSession.getMapper(NoticeMapper.class).searchContent(keyword);
	}

	@Override
	public List<NoticeDto> searchWriter(String keyword) {
		return sqlSession.getMapper(NoticeMapper.class).searchWriter(keyword);
	}

	@Override
	public List<CommentDto> getCommentList(int bnum) { // bnum번 게시글에 달린 댓글 목록 가져오기.
		return sqlSession.getMapper(CommentMapper.class).selectCommentList(bnum);
	}
	
	@Override
	public boolean writeComment(int bnum, String content, MemberDto loginInfo) {
		CommentDto dto = new CommentDto(bnum, loginInfo.getUserid(), content, null);
		if(sqlSession.getMapper(CommentMapper.class).insertComment(dto)==1) {
			return true;
		}
		return false;
	}
	
	@Override
	public void deleteComment(CommentDto dto) {
		sqlSession.getMapper(CommentMapper.class).deleteComment(dto);
	}
}
