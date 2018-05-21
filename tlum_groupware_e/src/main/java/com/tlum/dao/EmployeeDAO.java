package com.tlum.dao;

import java.util.List;

import com.tlum.dto.EmployeeVO;
import com.tlum.dto.SearchCriteria;

public interface EmployeeDAO {
	
	public List<EmployeeVO> selectEmployeeList()throws Exception;
	public EmployeeVO selectEmployeeById(String emp_id)throws Exception;
	public void insertEmployee(EmployeeVO employee) throws Exception;
	public void insertEmployeePic(EmployeeVO employee)throws Exception;
	public void updateEmployee(EmployeeVO employee)throws Exception;
	public void updateEmployeePic(EmployeeVO employee)throws Exception;
	public void deleteEmployee(String emp_id)throws Exception;
	
	public List<EmployeeVO> selectEmployeeListByDepNo(String dep_no)throws Exception;
	
	public int selectLogin(EmployeeVO employee)throws Exception;
	public List<EmployeeVO> selectSearchEmp(SearchCriteria cri) throws Exception;
	

}
