package com.ssafy.happyhouse.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.dto.CommentDto;

public interface CommentMapper {
	public int selectCommentCount(int bnum);
	public ArrayList<CommentDto> selectCommentList(@Param("bnum") int bnum);
	public int insertComment(CommentDto dto);
	public void deleteComment(CommentDto dto);
}
