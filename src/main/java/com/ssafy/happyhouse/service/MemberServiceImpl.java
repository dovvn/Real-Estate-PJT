package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean idCheck(String userid) {
		if(sqlSession.getMapper(MemberMapper.class).idCheck(userid) == null) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public MemberDto loginCheck(String userid, String userpw) {
		return sqlSession.getMapper(MemberMapper.class).loginCheck(userid, userpw);
	}

	@Override
	public int join(MemberDto member) {
		return sqlSession.getMapper(MemberMapper.class).join(member);
	}

	@Override
	public List<MemberDto> search() {
		return sqlSession.getMapper(MemberMapper.class).search();
	}
	
	@Override
	public List<MemberDto> searchName(String username) {
		return sqlSession.getMapper(MemberMapper.class).searchName(username);
	}

	@Override
	public int update(MemberDto member) {
		return sqlSession.getMapper(MemberMapper.class).update(member);
	}

	@Override
	public int updateById(MemberDto member) {
		return sqlSession.getMapper(MemberMapper.class).updateById(member);
	}

	@Override
	public int delete(String userid) {
		return sqlSession.getMapper(MemberMapper.class).delete(userid);
	}

	@Override
	public MemberDto findUser(String username, String userid, String userphone) {
		return sqlSession.getMapper(MemberMapper.class).findUser(username, userid, userphone);
	}
	
	@Override
	public int modifyRole(MemberDto dto) {
		return sqlSession.getMapper(MemberMapper.class).modifyRole(dto);
	}
}
