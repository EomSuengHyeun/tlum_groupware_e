package com.tlum.dto;

public class DepartmentVO {
	
	private String dep_no;
	private String dep_name;
	public DepartmentVO() {
		super();
	}
	public DepartmentVO(String dep_no, String dep_name) {
		super();
		this.dep_no = dep_no;
		this.dep_name = dep_name;
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
	@Override
	public String toString() {
		return "DepartmentVO [dep_no=" + dep_no + ", dep_name=" + dep_name + "]";
	}
	
	
	

}
