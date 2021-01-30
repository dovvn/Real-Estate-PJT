package com.ssafy.happyhouse.dto;

public class ChatDto {
	private int chatID; //채팅번호
	private String fromID; //나
	private String toID; //상대방
	private String chatContent; //채팅 내용
	private String chatTime; //전송 시간
	
	public ChatDto() {}
	
	public ChatDto(int chatID, String fromID, String toID, String chatContent, String chatTime) {
		super();
		this.chatID = chatID;
		this.fromID = fromID;
		this.toID = toID;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}
	public int getChatID() {
		return chatID;
	}
	public void setChatID(int chatID) {
		this.chatID = chatID;
	}
	public String getFromID() {
		return fromID;
	}
	public void setFromID(String fromID) {
		this.fromID = fromID;
	}
	public String gettoID() {
		return toID;
	}
	public void settoID(String toID) {
		this.toID = toID;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}

	@Override
	public String toString() {
		return "ChatDto [chatID=" + chatID + ", fromID=" + fromID + ", toID=" + toID + ", chatContent=" + chatContent
				+ ", chatTime=" + chatTime + "]";
	}
}
