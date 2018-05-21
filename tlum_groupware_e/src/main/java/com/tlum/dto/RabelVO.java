package com.tlum.dto;

public class RabelVO { // 라벨

	private String rabel_no; // 라벨번호
	private String rabel_type; // 라벨종류
	private String rabel_color; // 라벨색상
	private String department_no; // 부서번호
	private String emp_id; // 임직원아이디
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
	public RabelVO(String rabel_no, String rabel_type, String rabel_color, String department_no, String emp_id) {
		super();
		this.rabel_no = rabel_no;
		this.rabel_type = rabel_type;
		this.rabel_color = rabel_color;
		this.department_no = department_no;
		this.emp_id = emp_id;
	}
	public RabelVO() {}
	@Override
	public String toString() {
		return "RabelVO [rabel_no=" + rabel_no + ", rabel_type=" + rabel_type + ", rabel_color=" + rabel_color
				+ ", department_no=" + department_no + ", emp_id=" + emp_id + "]";
	}


}
