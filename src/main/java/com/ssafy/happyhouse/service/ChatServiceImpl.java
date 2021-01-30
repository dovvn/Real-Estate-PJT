package com.ssafy.happyhouse.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.ChatDto;
import com.ssafy.happyhouse.dto.RoomDto;
import com.ssafy.happyhouse.mapper.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	SqlSession chatService;
	
	@Override
	public ArrayList<ChatDto> getChatListByID(ChatDto dto) { //채팅 목록 조회
		ArrayList<ChatDto> cList = chatService.getMapper(ChatMapper.class).getChatListByID(dto);
		return cList;
	}

	@Override
	public int submit(ChatDto dto) { //채팅 전송
		return chatService.getMapper(ChatMapper.class).submit(dto);

	}

	@Override
	public ArrayList<ChatDto> chatLoadNewMessage(ChatDto dto) { //새로운 메시지 조회
		return chatService.getMapper(ChatMapper.class).chatLoadNewMessage(dto);
	}

	@Override
	public ArrayList<RoomDto> getRoomList() { //전체 채팅방 목록 출력
		return chatService.getMapper(ChatMapper.class).getRoomList();
	}

	@Override
	public int makeRoom(String userID) { //채팅방 생성
		int result = 0;
		
		//일단, 이 아이디로 만들어진 채팅방 이미 생성됐는지 검사
		if(!userID.equals(chatService.getMapper(ChatMapper.class).isRoom(userID))) {
			result = chatService.getMapper(ChatMapper.class).makeRoom(userID); //채팅방 생성
			System.out.println("=============관리자모드:    "+userID+"님과 채팅방 생성");

		}else {
			result = 0;
		}
		return result;
	}

	@Override
	public ArrayList<RoomDto> chatLoadNewRoom(int roomID) {
		return chatService.getMapper(ChatMapper.class).chatLoadNewRoom(roomID); //채팅방 생성
	}
}
