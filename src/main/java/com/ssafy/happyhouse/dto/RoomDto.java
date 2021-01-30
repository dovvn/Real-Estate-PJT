package com.ssafy.happyhouse.dto;

public class RoomDto {
	private int roomID; //방번호
	private String userID; //이 채팅방에서 대화하는 사용자 아이디
	
	public RoomDto() {}

	public RoomDto(int roomID, String userID) {
		super();
		this.roomID = roomID;
		this.userID = userID;
	}

	public int getRoomID() {
		return roomID;
	}

	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "RoomDto [roomID=" + roomID + ", userID=" + userID + "]";
	}
}
