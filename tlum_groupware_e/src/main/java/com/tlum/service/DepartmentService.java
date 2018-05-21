package com.tlum.service;

import java.util.List;

import com.tlum.dto.DepartmentVO;
import com.tlum.dto.SearchCriteria;

public interface DepartmentService {
	

	
	public List<DepartmentVO> selectDepartmentList()throws Exception;
	public List<DepartmentVO> selectSearchDepartmentList(SearchCriteria cri)throws Exception;
	
	int selectDepartmentCount(SearchCriteria cri)throws Exception;
	public DepartmentVO selectDepartmentById(String dep_no)throws Exception;
	public void insertDepartment(DepartmentVO department)throws Exception;
	public void updateDepartment(DepartmentVO department)throws Exception;
	public void deleteDepartment(String dep_no)throws Exception;
	
	

}
