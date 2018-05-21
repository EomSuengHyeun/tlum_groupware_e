package com.tlum.dto;

import java.util.Date;

public class CalenderVO { // 일정

	private String cal_no; // 일정번호
	private String cal_title; // 일정제목
	private String cal_content; // 일정내용
	private Date cal_start_time; // 일정시작시간
	private Date cal_end_time; // 일정종료시간
	private String rabel_no; // 라벨번호

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
		this.cal_end_time= cal_end_time;
	}

	public String getRabel_no() {
		return rabel_no;
	}

	public void setRabel_no(String rabel_no) {
		this.rabel_no = rabel_no;
	}

	@Override
	public String toString() {
		return "calenderVO [cal_no=" + cal_no + ", cal_title=" + cal_title + ", cal_content=" + cal_content
				+ ", cal_start_time=" + cal_start_time + ", cal_end_time=" + cal_end_time+ ", rabel_no=" + rabel_no
				+ "]";
	}

	public CalenderVO(String cal_no, String cal_title, String cal_content, Date cal_start_time, Date cal_end_time,
			String rabel_no) {
		super();
		this.cal_no = cal_no;
		this.cal_title = cal_title;
		this.cal_content = cal_content;
		this.cal_start_time = cal_start_time;
		this.cal_end_time = cal_end_time;
		this.rabel_no = rabel_no;
	}
	public CalenderVO() {}

}
