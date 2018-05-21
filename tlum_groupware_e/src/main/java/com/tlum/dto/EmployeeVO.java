package com.tlum.dto;

import java.util.Date;

public class EmployeeVO {

	private String emp_id;
	private String emp_password;
	private String emp_name;
	private Date emp_entry_date;
	private String emp_address;
	private Date emp_birthday;
	private String emp_email;
	private String emp_phone;
	private String emp_current_status;
	private String grade_no;
	private String grade_name;
	private String position_no;
	private String position_name;
	private String dep_no;
	private String dep_name;
	
	private String emp_pic_no;
	private String emp_pic_path;
	
	
	public EmployeeVO() {}


	public EmployeeVO(String emp_id, String emp_password, String emp_name, Date emp_entry_date, String emp_address,
			Date emp_birthday, String emp_email, String emp_phone, String emp_current_status, String grade_no,
			String grade_name, String position_no, String position_name, String dep_no, String dep_name,
			String emp_pic_no, String emp_pic_path) {
		super();
		this.emp_id = emp_id;
		this.emp_password = emp_password;
		this.emp_name = emp_name;
		this.emp_entry_date = emp_entry_date;
		this.emp_address = emp_address;
		this.emp_birthday = emp_birthday;
		this.emp_email = emp_email;
		this.emp_phone = emp_phone;
		this.emp_current_status = emp_current_status;
		this.grade_no = grade_no;
		this.grade_name = grade_name;
		this.position_no = position_no;
		this.position_name = position_name;
		this.dep_no = dep_no;
		this.dep_name = dep_name;
		this.emp_pic_no = emp_pic_no;
		this.emp_pic_path = emp_pic_path;
	}


	public String getEmp_id() {
		return emp_id;
	}


	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}


	public String getEmp_password() {
		return emp_password;
	}


	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}


	public String getEmp_name() {
		return emp_name;
	}


	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}


	public Date getEmp_entry_date() {
		return emp_entry_date;
	}


	public void setEmp_entry_date(Date emp_entry_date) {
		this.emp_entry_date = emp_entry_date;
	}


	public String getEmp_address() {
		return emp_address;
	}


	public void setEmp_address(String emp_address) {
		this.emp_address = emp_address;
	}


	public Date getEmp_birthday() {
		return emp_birthday;
	}


	public void setEmp_birthday(Date emp_birthday) {
		this.emp_birthday = emp_birthday;
	}


	public String getEmp_email() {
		return emp_email;
	}


	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}


	public String getEmp_phone() {
		return emp_phone;
	}


	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}


	public String getEmp_current_status() {
		return emp_current_status;
	}


	public void setEmp_current_status(String emp_current_status) {
		this.emp_current_status = emp_current_status;
	}


	public String getGrade_no() {
		return grade_no;
	}


	public void setGrade_no(String grade_no) {
		this.grade_no = grade_no;
	}


	public String getGrade_name() {
		return grade_name;
	}


	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}


	public String getPosition_no() {
		return position_no;
	}


	public void setPosition_no(String position_no) {
		this.position_no = position_no;
	}


	public String getPosition_name() {
		return position_name;
	}


	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}


	public String getDep_no() {
		return dep_no;
	}


	public void setDep_no(String dep_no) {
		this.dep_no = dep_no;
	}


	public String getDep_name() {
		return dep_name;
	}


	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}


	public String getEmp_pic_no() {
		return emp_pic_no;
	}


	public void setEmp_pic_no(String emp_pic_no) {
		this.emp_pic_no = emp_pic_no;
	}


	public String getEmp_pic_path() {
		return emp_pic_path;
	}


	public void setEmp_pic_path(String emp_pic_path) {
		this.emp_pic_path = emp_pic_path;
	}


	@Override
	public String toString() {
		return "EmployeeVO [emp_id=" + emp_id + ", emp_password=" + emp_password + ", emp_name=" + emp_name
				+ ", emp_entry_date=" + emp_entry_date + ", emp_address=" + emp_address + ", emp_birthday="
				+ emp_birthday + ", emp_email=" + emp_email + ", emp_phone=" + emp_phone + ", emp_current_status="
				+ emp_current_status + ", grade_no=" + grade_no + ", grade_name=" + grade_name + ", position_no="
				+ position_no + ", position_name=" + position_name + ", dep_no=" + dep_no + ", dep_name=" + dep_name
				+ ", emp_pic_no=" + emp_pic_no + ", emp_pic_path=" + emp_pic_path + "]";
	}


	


	
	
	

}
