package com.tlum.dto;

import java.util.Date;

public class NoticeBoardVO {

	private String notice_board_bno;
	private String notice_board_title;
	private String notice_board_content;
	private Date notice_board_regdate;

	public NoticeBoardVO(){}
	public NoticeBoardVO(String notice_board_bno, String notice_board_title, String notice_board_content,
			Date notice_board_regdate) {
		super();
		this.notice_board_bno = notice_board_bno;
		this.notice_board_title = notice_board_title;
		this.notice_board_content = notice_board_content;
		this.notice_board_regdate = notice_board_regdate;
	}

	public String getNotice_board_bno() {
		return notice_board_bno;
	}

	public void setNotice_board_bno(String notice_board_bno) {
		this.notice_board_bno = notice_board_bno;
	}

	public String getNotice_board_title() {
		return notice_board_title;
	}

	public void setNotice_board_title(String notice_board_title) {
		this.notice_board_title = notice_board_title;
	}

	public String getNotice_board_content() {
		return notice_board_content;
	}

	public void setNotice_board_content(String notice_board_content) {
		this.notice_board_content = notice_board_content;
	}

	public Date getNotice_board_regdate() {
		return notice_board_regdate;
	}

	public void setNotice_board_regdate(Date notice_board_regdate) {
		this.notice_board_regdate = notice_board_regdate;
	}

	@Override
	public String toString() {
		return "NoticeBoardVO [notice_board_bno=" + notice_board_bno + ", notice_board_title=" + notice_board_title
				+ ", notice_board_content=" + notice_board_content + ", notice_board_regdate=" + notice_board_regdate
				+ "]";
	}

}