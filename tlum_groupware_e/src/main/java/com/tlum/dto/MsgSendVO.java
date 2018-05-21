package com.tlum.dto;

import java.util.Date;

public class MsgSendVO {
	
	private String msg_title;
	private String msg_content;
	private Date msg_regdate;
	private String msg_file_name;
	private String msg_view;
	private String msg_no;
	private String receive_id;
	private String receive_name;
	private String emp_id;
	
	public MsgSendVO() {}

	public MsgSendVO(String msg_title, String msg_content, Date msg_regdate, String msg_file_name, String msg_view,
			String msg_no, String receive_id, String receive_name, String emp_id) {
		super();
		this.msg_title = msg_title;
		this.msg_content = msg_content;
		this.msg_regdate = msg_regdate;
		this.msg_file_name = msg_file_name;
		this.msg_view = msg_view;
		this.msg_no = msg_no;
		this.receive_id = receive_id;
		this.receive_name = receive_name;
		this.emp_id = emp_id;
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

	public String getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(String msg_no) {
		this.msg_no = msg_no;
	}

	public String getReceive_id() {
		return receive_id;
	}

	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}

	public String getReceive_name() {
		return receive_name;
	}

	public void setReceive_name(String receive_name) {
		this.receive_name = receive_name;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	@Override
	public String toString() {
		return "MsgSendVO [msg_title=" + msg_title + ", msg_content=" + msg_content + ", msg_regdate=" + msg_regdate
				+ ", msg_file_name=" + msg_file_name + ", msg_view=" + msg_view + ", msg_no=" + msg_no + ", receive_id="
				+ receive_id + ", receive_name=" + receive_name + ", emp_id=" + emp_id + "]";
	}


	
	
	

}
