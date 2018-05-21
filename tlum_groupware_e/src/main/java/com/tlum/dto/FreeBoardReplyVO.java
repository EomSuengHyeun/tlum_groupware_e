package com.tlum.dto;

import java.util.Date;

public class FreeBoardReplyVO { // 자유게시판 댓글 

	private String reply_no; // 댓글번호
	private String reply_text; // 댓글내용
	private Date reply_regdate; // 작성시간
	private String free_board_bno; // 게시글번호
	private String emp_id; // 작성자
	private String emp_name;
	

	public FreeBoardReplyVO() {}


	public FreeBoardReplyVO(String reply_no, String reply_text, Date reply_regdate, String free_board_bno,
			String emp_id, String emp_name) {
		super();
		this.reply_no = reply_no;
		this.reply_text = reply_text;
		this.reply_regdate = reply_regdate;
		this.free_board_bno = free_board_bno;
		this.emp_id = emp_id;
		this.emp_name = emp_name;
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


	public String getFree_board_bno() {
		return free_board_bno;
	}


	public void setFree_board_bno(String free_board_bno) {
		this.free_board_bno = free_board_bno;
	}


	public String getEmp_id() {
		return emp_id;
	}


	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}


	public String getEmp_name() {
		return emp_name;
	}


	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}


	@Override
	public String toString() {
		return "FreeBoardReplyVO [reply_no=" + reply_no + ", reply_text=" + reply_text + ", reply_regdate="
				+ reply_regdate + ", free_board_bno=" + free_board_bno + ", emp_id=" + emp_id + ", emp_name=" + emp_name
				+ "]";
	}


	


	
	
	

}
