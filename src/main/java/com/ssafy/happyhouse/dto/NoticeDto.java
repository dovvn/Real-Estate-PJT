package com.ssafy.happyhouse.dto;

public class NoticeDto {
	private int bnum; //글번호
	private String btitle; //제목
	private String userid; //작성자
	private int breadcnt; //조회수
	private String bwritedate; //작성 날짜
	private String bcontent; //내용
	private int cmtCnt; // 댓글 갯수
	
	public NoticeDto() {}
	
	public NoticeDto(int bnum, String btitle, String userid, int breadcnt, String bwritedate, String bcontent,
			int cmtCnt) {
		super();
		this.bnum = bnum;
		this.btitle = btitle;
		this.userid = userid;
		this.breadcnt = breadcnt;
		this.bwritedate = bwritedate;
		this.bcontent = bcontent;
		this.cmtCnt = cmtCnt;
	}



	public NoticeDto(String btitle, String userid, int bread_cnt, String bwritedate, String bcontent) {
		super();
		this.btitle = btitle;
		this.userid = userid;
		this.breadcnt = bread_cnt;
		this.bwritedate = bwritedate;
		this.bcontent = bcontent;
	}
	
	public NoticeDto(int bnum, String btitle, String userid, int bread_cnt, String bwritedate, String bcontent) {
		super();
		this.bnum = bnum;
		this.btitle = btitle;
		this.userid = userid;
		this.breadcnt = bread_cnt;
		this.bwritedate = bwritedate;
		this.bcontent = bcontent;
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

	public void setBtitle(String btitle) {
		this.btitle = btitle;
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

	public void setBwritedate(String bwritedate) {
		this.bwritedate = bwritedate;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public int getCmtCnt() {
		return cmtCnt;
	}

	public void setCmtCnt(int cmtCnt) {
		this.cmtCnt = cmtCnt;
	}

	@Override
	public String toString() {
		return "NoticeDto [bnum=" + bnum + ", btitle=" + btitle + ", userid=" + userid + ", breadcnt=" + breadcnt
				+ ", bwritedate=" + bwritedate + ", bcontent=" + bcontent + ", cmtCnt=" + cmtCnt + "]";
	}
}
