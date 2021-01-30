package com.ssafy.happyhouse.dto;

public class CommentDto {
	private int cnum;	// 코멘트 식별번호
	private int bnum; 	// 게시글 번호
	private String cwriter;	// 코멘트 작성자
	private String ccontent; // 코멘트 내용
	private String cwriteDate; // 작성일시
///////////////////////////////////////////////////////////////////////////////////////////////	
	public CommentDto() {}
	public CommentDto(int cnum, int bnum, String cwriter, String ccontent, String cwriteDate) {
		this.cnum = cnum;
		this.bnum = bnum;
		this.cwriter = cwriter;
		this.ccontent = ccontent;
		this.cwriteDate = cwriteDate;
	}
	
	public CommentDto(int bnum, String cwriter, String ccontent, String cwriteDate) {
		this.bnum = bnum;
		this.cwriter = cwriter;
		this.ccontent = ccontent;
		this.cwriteDate = cwriteDate;
	}
///////////////////////////////////////////////////////////////////////////////////////////////	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getCwriter() {
		return cwriter;
	}
	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCwriteDate() {
		return cwriteDate;
	}
	public void setCwriteDate(String cwriteDate) {
		this.cwriteDate = cwriteDate;
	}
	@Override
	public String toString() {
		return "CommentDto [cnum=" + cnum + ", bnum=" + bnum + ", cwriter=" + cwriter + ", ccontent=" + ccontent
				+ ", cwriteDate=" + cwriteDate + "]";
	}
}
