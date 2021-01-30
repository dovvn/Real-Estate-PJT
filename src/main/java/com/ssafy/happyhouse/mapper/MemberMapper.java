package com.ssafy.happyhouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.dto.MemberDto;

public interface MemberMapper {
	public MemberDto loginCheck(@Param("userid") String userid, @Param("userpw") String userpw); //로그인 체크
	public int join(MemberDto member); //회원가입
	public List<MemberDto> search(); //회원정보 조회
	public List<MemberDto> searchName(String username); //회원정보이름 조회
	public int update(MemberDto member); //회원정보 수정
	public int updateById(MemberDto member); //아이디로 회원정보 수정
	public int delete(String userid); //회원정보 삭제
	public MemberDto findUser(@Param("username") String username, @Param("userid") String userid, @Param("userphone") String userphone); //비밀번호 찾기
	public MemberDto idCheck(String userid); // id 중복 체크
	public int modifyRole(MemberDto dto); // 회원 관리자 정보 수정
}
