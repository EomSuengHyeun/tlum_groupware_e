package com.tlum.service;

import java.util.List;

import com.tlum.dto.EmployeeVO;
import com.tlum.dto.SearchCriteria;

public interface EmployeeService {
	
	public List<EmployeeVO> selectEmployeeList()throws Exception;
	public EmployeeVO selectEmployeeById(String emp_id)throws Exception;
	public void insertEmployee(EmployeeVO employee)throws Exception; 
	public void updateEmployee(EmployeeVO employee)throws Exception;
	public void deleteEmployee(String emp_id)throws Exception;
	
	public void insertEmployeePic(EmployeeVO employee)throws Exception;
	
	public List<EmployeeVO> selectEmployeeListByDepNo(String dep_no)throws Exception;
	
	public boolean empLoginChk(EmployeeVO employee)throws Exception;
	
	public List<EmployeeVO> selectSearchEmploy(SearchCriteria cri) throws Exception;

}
