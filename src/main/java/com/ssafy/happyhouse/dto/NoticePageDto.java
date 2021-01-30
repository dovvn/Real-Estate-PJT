package com.ssafy.happyhouse.dto;

import java.util.List;

public class NoticePageDto {
	private List<NoticeDto> noticeList;
	private int curPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	public NoticePageDto() {}
	
	public NoticePageDto(List<NoticeDto> noticeList, int curPage, int startPage, int endPage, int totalPage) {
		this.noticeList = noticeList;
		this.curPage = curPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
	}
	public List<NoticeDto> getnoticeList() {
		return noticeList;
	}
	public void setnoticeList(List<NoticeDto> noticeList) {
		this.noticeList = noticeList;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
