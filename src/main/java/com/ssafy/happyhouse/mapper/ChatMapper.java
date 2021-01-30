package com.ssafy.happyhouse.mapper;

import java.util.ArrayList;

import com.ssafy.happyhouse.dto.ChatDto;
import com.ssafy.happyhouse.dto.RoomDto;

public interface ChatMapper {
	public ArrayList<ChatDto> getChatListByID(ChatDto dto); //채팅목록 조회
	public int submit(ChatDto dto); //채팅 전송
	public ArrayList<ChatDto> chatLoadNewMessage(ChatDto dto); //새로운 메시지 조회
	
	
	public ArrayList<RoomDto> getRoomList(); //전체 채팅방 목록
	public String isRoom(String userID); //이 아이디로 만들어진 채팅방이 있는지 검사
	public int makeRoom(String userID); //채팅방 생성
	public ArrayList<RoomDto> chatLoadNewRoom(int roomID); //새로운 채팅방 조회
}
