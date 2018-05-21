package com.tlum.dto;

import java.util.Date;

public class LimitBoardReplyVO {

	private String reply_no;
	private String reply_text;
	private Date reply_regdate;
	private String limit_board_bno;
	private String emp_id;

	public LimitBoardReplyVO() {}
	public LimitBoardReplyVO(String reply_no, String reply_text, Date reply_regdate, String limit_board_bno,
			String emp_id) {
		super();
		this.reply_no = reply_no;
		this.reply_text = reply_text;
		this.reply_regdate = reply_regdate;
		this.limit_board_bno = limit_board_bno;
		this.emp_id = emp_id;
	}

	public String getReply_no() {
		return reply_no;
	}

	public void setReply_no(String reply_no) {
		this.reply_no = reply_no;
	}

	public String getReply_text() {
		return reply_text;
	}

	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}

	public Date getReply_regdate() {
		return reply_regdate;
	}

	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}

	public String getLimit_board_bno() {
		return limit_board_bno;
	}

	public void setLimit_board_bno(String limit_board_bno) {
		this.limit_board_bno = limit_board_bno;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	@Override
	public String toString() {
		return "LimitBoardReplyVO [reply_no=" + reply_no + ", reply_text=" + reply_text + ", reply_regdate="
				+ reply_regdate + ", limit_board_bno=" + limit_board_bno + ", emp_id=" + emp_id + "]";
	}

}