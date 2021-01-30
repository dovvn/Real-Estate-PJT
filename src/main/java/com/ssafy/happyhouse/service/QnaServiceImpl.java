package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.happyhouse.dto.QnaDto;
import com.ssafy.happyhouse.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<QnaDto> searchTitle(String keyword) {
		return sqlSession.getMapper(QnaMapper.class).searchTitle(keyword);
	}

	@Override
	public List<QnaDto> searchContent(String keyword) {
		return sqlSession.getMapper(QnaMapper.class).searchContent(keyword);
	}

	@Override
	public List<QnaDto> searchWriter(String keyword) {
		return sqlSession.getMapper(QnaMapper.class).searchWriter(keyword);
	}

	@Override
	public List<QnaDto> getBoardList() {
		return sqlSession.getMapper(QnaMapper.class).getBoardList();
	}

	@Override
	public boolean delete(int bnum) {
		return sqlSession.getMapper(QnaMapper.class).delete(bnum);
	}

	@Override
	public QnaDto getBoard(int bnum) { //질문 상세보기
		sqlSession.getMapper(QnaMapper.class).updateReadcnt(bnum); // 읽기전에 조회수부터 증가 시키고
		return sqlSession.getMapper(QnaMapper.class).getBoard(bnum);
	}

	@Override
	public boolean update(QnaDto dto) {
		return sqlSession.getMapper(QnaMapper.class).update(dto);
	}

	@Override
	public boolean write(QnaDto dto) {
		return sqlSession.getMapper(QnaMapper.class).write(dto);
	}

	@Override
	public boolean ansWrite(QnaDto dto) { //답변 작성 
		return sqlSession.getMapper(QnaMapper.class).ansWrite(dto);
	}

	@Override
	public boolean ansUpdate(QnaDto dto) { //답변 수정
		return sqlSession.getMapper(QnaMapper.class).ansUpdate(dto);
	}

	@Override
	public boolean ansDelete(int bnum) { //답변 삭제
		return sqlSession.getMapper(QnaMapper.class).ansDelete(bnum);
	}

	@Override
	public List<QnaDto> getAnsList(int questionnum) { //답변 목록
		return sqlSession.getMapper(QnaMapper.class).getAnsList(questionnum);
	}

	@Override
	public List<QnaDto> getFAQList() { //FAQ 목록
		return sqlSession.getMapper(QnaMapper.class).getFAQList();

	}
	
	
}
