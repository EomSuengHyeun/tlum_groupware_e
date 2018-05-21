package com.tlum.dto;

import java.util.Date;

public class CalLoadDTO {
	private String cal_no; // 일정번호
	private String cal_title; // 일정제목
	private String cal_content; // 일정내용
	private Date cal_start_time; // 일정시작시간
	private Date cal_end_time; // 일정종료시간
	private String rabel_no; // 라벨번호
	private String rabel_type; // 라벨종류
	private String rabel_color; // 라벨색상
	private String department_no; // 부서번호
	private String emp_id; // 임직원아이디
	public String getCal_no() {
		return cal_no;
	}
	public void setCal_no(String cal_no) {
		this.cal_no = cal_no;
	}
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public String getCal_content() {
		return cal_content;
	}
	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}
	public Date getCal_start_time() {
		return cal_start_time;
	}
	public void setCal_start_time(Date cal_start_time) {
		this.cal_start_time = cal_start_time;
	}
	public Date getCal_end_time() {
		return cal_end_time;
	}
	public void setCal_end_time(Date cal_end_time) {
		this.cal_end_time = cal_end_time;
	}
	public String getRabel_no() {
		return rabel_no;
	}
	public void setRabel_no(String rabel_no) {
		this.rabel_no = rabel_no;
	}
	public String getRabel_type() {
		return rabel_type;
	}
	public void setRabel_type(String rabel_type) {
		this.rabel_type = rabel_type;
	}
	public String getRabel_color() {
		return rabel_color;
	}
	public void setRabel_color(String rabel_color) {
		this.rabel_color = rabel_color;
	}
	public String getDepartment_no() {
		return department_no;
	}
	public void setDepartment_no(String department_no) {
		this.department_no = department_no;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public CalLoadDTO(String cal_no, String cal_title, String cal_content, Date cal_start_time, Date cal_end_time,
			String rabel_no, String rabel_type, String rabel_color, String department_no, String emp_id) {
		super();
		this.cal_no = cal_no;
		this.cal_title = cal_title;
		this.cal_content = cal_content;
		this.cal_start_time = cal_start_time;
		this.cal_end_time = cal_end_time;
		this.rabel_no = rabel_no;
		this.rabel_type = rabel_type;
		this.rabel_color = rabel_color;
		this.department_no = department_no;
		this.emp_id = emp_id;
	}
	public CalLoadDTO() {
	}
	@Override
	public String toString() {
		return "calLoadVO [cal_no=" + cal_no + ", cal_title=" + cal_title + ", cal_content=" + cal_content
				+ ", cal_start_time=" + cal_start_time + ", cal_end_time=" + cal_end_time + ", rabel_no=" + rabel_no
				+ ", rabel_type=" + rabel_type + ", rabel_color=" + rabel_color + ", department_no=" + department_no
				+ ", emp_id=" + emp_id + "]";
	}
	
	
}
