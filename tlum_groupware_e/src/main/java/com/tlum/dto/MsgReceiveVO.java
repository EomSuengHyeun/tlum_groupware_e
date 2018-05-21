package com.tlum.dto;

import java.util.Date;

public class MsgReceiveVO {
	
	private String msg_no;
	private String msg_title;
	private String msg_content;
	private Date msg_regdate;
	private String msg_file_name;
	private String msg_view;
	private String send_id;
	private String send_name;
	private String emp_id;
	
	
	public MsgReceiveVO() {}


	public MsgReceiveVO(String msg_no, String msg_title, String msg_content, Date msg_regdate, String msg_file_name,
			String msg_view, String send_id, String send_name, String emp_id) {
		super();
		this.msg_no = msg_no;
		this.msg_title = msg_title;
		this.msg_content = msg_content;
		this.msg_regdate = msg_regdate;
		this.msg_file_name = msg_file_name;
		this.msg_view = msg_view;
		this.send_id = send_id;
		this.send_name = send_name;
		this.emp_id = emp_id;
	}


	public String getMsg_no() {
		return msg_no;
	}


	public void setMsg_no(String msg_no) {
		this.msg_no = msg_no;
	}


	public String getMsg_title() {
		return msg_title;
	}


	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}


	public String getMsg_content() {
		return msg_content;
	}


	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}


	public Date getMsg_regdate() {
		return msg_regdate;
	}


	public void setMsg_regdate(Date msg_regdate) {
		this.msg_regdate = msg_regdate;
	}


	public String getMsg_file_name() {
		return msg_file_name;
	}


	public void setMsg_file_name(String msg_file_name) {
		this.msg_file_name = msg_file_name;
	}


	public String getMsg_view() {
		return msg_view;
	}


	public void setMsg_view(String msg_view) {
		this.msg_view = msg_view;
	}


	public String getSend_id() {
		return send_id;
	}


	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}


	public String getSend_name() {
		return send_name;
	}


	public void setSend_name(String send_name) {
		this.send_name = send_name;
	}


	public String getEmp_id() {
		return emp_id;
	}


	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}


	@Override
	public String toString() {
		return "MsgReceiveVO [msg_no=" + msg_no + ", msg_title=" + msg_title + ", msg_content=" + msg_content
				+ ", msg_regdate=" + msg_regdate + ", msg_file_name=" + msg_file_name + ", msg_view=" + msg_view
				+ ", send_id=" + send_id + ", send_name=" + send_name + ", emp_id=" + emp_id + "]";
	}
	
	
	
	
}
