package com.tlum.dto;

import java.util.Date;

public class LimitBoardVO {

	private String limit_board_bno;
	private String limit_board_title;
	private String limit_board_content;
	private Date limit_board_regdate;
	private String emp_id;
	private String grade_no;
	private String emp_name;

	public LimitBoardVO() {
		super();
	}

	public LimitBoardVO(String limit_board_bno, String limit_board_title, String limit_board_content,
			Date limit_board_regdate, String emp_id, String grade_no, String emp_name) {
		super();
		this.limit_board_bno = limit_board_bno;
		this.limit_board_title = limit_board_title;
		this.limit_board_content = limit_board_content;
		this.limit_board_regdate = limit_board_regdate;
		this.emp_id = emp_id;
		this.grade_no = grade_no;
		this.emp_name = emp_name;
	}

	public String getLimit_board_bno() {
		return limit_board_bno;
	}

	public void setLimit_board_bno(String limit_board_bno) {
		this.limit_board_bno = limit_board_bno;
	}

	public String getLimit_board_title() {
		return limit_board_title;
	}

	public void setLimit_board_title(String limit_board_title) {
		this.limit_board_title = limit_board_title;
	}

	public String getLimit_board_content() {
		return limit_board_content;
	}

	public void setLimit_board_content(String limit_board_content) {
		this.limit_board_content = limit_board_content;
	}

	public Date getLimit_board_regdate() {
		return limit_board_regdate;
	}

	public void setLimit_board_regdate(Date limit_board_regdate) {
		this.limit_board_regdate = limit_board_regdate;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getGrade_no() {
		return grade_no;
	}

	public void setGrade_no(String grade_no) {
		this.grade_no = grade_no;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	@Override
	public String toString() {
		return "LimitBoardVO [limit_board_bno=" + limit_board_bno + ", limit_board_title=" + limit_board_title
				+ ", limit_board_content=" + limit_board_content + ", limit_board_regdate=" + limit_board_regdate
				+ ", emp_id=" + emp_id + ", grade_no=" + grade_no + ", emp_name=" + emp_name + "]";
	}

}