package com.ssafy.happyhouse.dto;

public class QnaDto {
	private int bnum; //글번호
	private String btitle; //글제목
	private String userid; //작성자
	private int breadcnt; //조회수
	private String bwritedate; //작성날짜
	private String bcontent; //글내용
	private int questionnum;
	private boolean isFAQ; //자주 묻는 질문(공지)인지
	
	public QnaDto() {}
	
	public QnaDto(int bnum, String title, String userid, int breadcnt, String writedate, String bcontent,
			int questionnum) {
		super();
		this.bnum = bnum;
		this.btitle = title;
		this.userid = userid;
		this.breadcnt = breadcnt;
		this.bwritedate = writedate;
		this.bcontent = bcontent;
		this.questionnum = questionnum;
	}
	
	public QnaDto(int bnum, String btitle, String userid, int breadcnt, String bwritedate, String bcontent,
			int questionnum, boolean isFAQ) {
		super();
		this.bnum = bnum;
		this.btitle = btitle;
		this.userid = userid;
		this.breadcnt = breadcnt;
		this.bwritedate = bwritedate;
		this.bcontent = bcontent;
		this.questionnum = questionnum;
		this.isFAQ = isFAQ;
	}

	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String title) {
		this.btitle = title;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBreadcnt() {
		return breadcnt;
	}
	public void setBreadcnt(int breadcnt) {
		this.breadcnt = breadcnt;
	}
	public String getBwritedate() {
		return bwritedate;
	}
	public void setBwritedate(String writedate) {
		this.bwritedate = writedate;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getQuestionnum() {
		return questionnum;
	}
	public void setQuestionnum(int questionnum) {
		this.questionnum = questionnum;
	}
	
	public boolean isFAQ() {
		return isFAQ;
	}

	public void setFAQ(boolean isFAQ) {
		this.isFAQ = isFAQ;
	}

	@Override
	public String toString() {
		return "QnaDto [bnum=" + bnum + ", btitle=" + btitle + ", userid=" + userid + ", breadcnt=" + breadcnt
				+ ", bwritedate=" + bwritedate + ", bcontent=" + bcontent + ", questionnum=" + questionnum + ", isFAQ="
				+ isFAQ + "]";
	}
}
