package com.tlum.dto;

import java.util.Date;

public class FreeBoardVO { // 자유

	private String free_board_bno; // 게시글번호
	private String free_board_title; // 게시판 제목
	private String free_board_content; // 게시글 내용
	private Date free_board_regdate; // 작성시간
	private String emp_id; // 작성자
	private String emp_name;
	
	public FreeBoardVO() {}

	public FreeBoardVO(String free_board_bno, String free_board_title, String free_board_content,
			Date free_board_regdate, String emp_id, String emp_name) {
		super();
		this.free_board_bno = free_board_bno;
		this.free_board_title = free_board_title;
		this.free_board_content = free_board_content;
		this.free_board_regdate = free_board_regdate;
		this.emp_id = emp_id;
		this.emp_name = emp_name;
	}

	public String getFree_board_bno() {
		return free_board_bno;
	}

	public void setFree_board_bno(String free_board_bno) {
		this.free_board_bno = free_board_bno;
	}

	public String getFree_board_title() {
		return free_board_title;
	}

	public void setFree_board_title(String free_board_title) {
		this.free_board_title = free_board_title;
	}

	public String getFree_board_content() {
		return free_board_content;
	}

	public void setFree_board_content(String free_board_content) {
		this.free_board_content = free_board_content;
	}

	public Date getFree_board_regdate() {
		return free_board_regdate;
	}

	public void setFree_board_regdate(Date free_board_regdate) {
		this.free_board_regdate = free_board_regdate;
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
		return "FreeBoardVO [free_board_bno=" + free_board_bno + ", free_board_title=" + free_board_title
				+ ", free_board_content=" + free_board_content + ", free_board_regdate=" + free_board_regdate
				+ ", emp_id=" + emp_id + ", emp_name=" + emp_name + "]";
	}
	
	

}
