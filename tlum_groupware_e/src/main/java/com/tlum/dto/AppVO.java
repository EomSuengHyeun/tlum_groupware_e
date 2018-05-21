package com.tlum.dto;

import java.util.Date;

public class AppVO {
	private String app_no;
	private String app_title;
	private String app_content;
	private String app_progress;
	private Date app_update_date;
	private Date app_regdate;
	private String emp_id;
	private String emp_name;
	private String caregory_no;
	public AppVO() {
		super();
	}
	public AppVO(String app_no, String app_title, String app_content, String app_progress, Date app_update_date,
			Date app_regdate, String emp_id, String emp_name, String caregory_no) {
		super();
		this.app_no = app_no;
		this.app_title = app_title;
		this.app_content = app_content;
		this.app_progress = app_progress;
		this.app_update_date = app_update_date;
		this.app_regdate = app_regdate;
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.caregory_no = caregory_no;
	}
	public String getApp_no() {
		return app_no;
	}
	public void setApp_no(String app_no) {
		this.app_no = app_no;
	}
	public String getApp_title() {
		return app_title;
	}
	public void setApp_title(String app_title) {
		this.app_title = app_title;
	}
	public String getApp_content() {
		return app_content;
	}
	public void setApp_content(String app_content) {
		this.app_content = app_content;
	}
	public String getApp_progress() {
		return app_progress;
	}
	public void setApp_progress(String app_progress) {
		this.app_progress = app_progress;
	}
	public Date getApp_update_date() {
		return app_update_date;
	}
	public void setApp_update_date(Date app_update_date) {
		this.app_update_date = app_update_date;
	}
	public Date getApp_regdate() {
		return app_regdate;
	}
	public void setApp_regdate(Date app_regdate) {
		this.app_regdate = app_regdate;
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
	public String getCaregory_no() {
		return caregory_no;
	}
	public void setCaregory_no(String caregory_no) {
		this.caregory_no = caregory_no;
	}
	@Override
	public String toString() {
		return "AppVO [app_no=" + app_no + ", app_title=" + app_title + ", app_content=" + app_content
				+ ", app_progress=" + app_progress + ", app_update_date=" + app_update_date + ", app_regdate="
				+ app_regdate + ", emp_id=" + emp_id + ", emp_name=" + emp_name + ", caregory_no=" + caregory_no + "]";
	}
	
	
}
