package com.tlum.service;

import java.util.List;

import com.tlum.dao.EmployeeDAO;
import com.tlum.dto.EmployeeVO;
import com.tlum.dto.SearchCriteria;

public class EmployeeServiceImpl implements EmployeeService {
	
	private EmployeeDAO employeeDAO;
	
	public void setEmployeeDAO(EmployeeDAO employeeDAO){
		this.employeeDAO=employeeDAO;
	}
	
	public EmployeeDAO getEmployeeDAO() {
		return employeeDAO;
	}



	@Override
	public List<EmployeeVO> selectEmployeeList() throws Exception {
		List<EmployeeVO> employee= employeeDAO.selectEmployeeList();
		return employee;
	}

	@Override
	public void insertEmployee(EmployeeVO employee) throws Exception {
		employeeDAO.insertEmployee(employee);
	}
	
	
	@Override
	public EmployeeVO selectEmployeeById(String emp_id) throws Exception {
		EmployeeVO employee = employeeDAO.selectEmployeeById(emp_id);
		return employee;
	}

	@Override
	public void updateEmployee(EmployeeVO employee) throws Exception {
		System.out.println("employee2222");
		employeeDAO.updateEmployee(employee);
		System.out.println("employee3333");
		if(employee.getEmp_pic_path()!=null){
			employeeDAO.updateEmployeePic(employee);
		}
	}

	@Override
	public void deleteEmployee(String emp_id) throws Exception {
		employeeDAO.deleteEmployee(emp_id);
	}

	@Override
	public void insertEmployeePic(EmployeeVO employee) throws Exception {
		employee.setEmp_pic_no(employee.getEmp_id());
		employee.setEmp_pic_path("default");
		System.out.println("em"+employee);
		
		System.out.println(employeeDAO.selectEmployeeById(employee.getEmp_id()));
		employeeDAO.insertEmployeePic(employee);
	}

	@Override
	public List<EmployeeVO> selectEmployeeListByDepNo(String dep_no) throws Exception {
		List<EmployeeVO> employeeDepNo= employeeDAO.selectEmployeeListByDepNo(dep_no);
		return employeeDepNo;
	}

	@Override
	public boolean empLoginChk(EmployeeVO employee) throws Exception {
		int LoginChk=employeeDAO.selectLogin(employee);
		boolean loginTF;
		if(LoginChk==0){
			loginTF= false;
			
		}else{
			loginTF= true;
			 
		}
		return loginTF;
	}
	@Override
	public List<EmployeeVO> selectSearchEmploy(SearchCriteria cri) throws Exception {
		List<EmployeeVO> SearcEmp = employeeDAO.selectSearchEmp(cri);
		return SearcEmp;
	}

}
