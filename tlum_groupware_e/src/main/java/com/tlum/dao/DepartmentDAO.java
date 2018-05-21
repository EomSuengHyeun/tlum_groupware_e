package com.tlum.dao;

import java.util.List;

import com.tlum.dto.DepartmentVO;
import com.tlum.dto.SearchCriteria;

public interface DepartmentDAO {
	
	List<DepartmentVO> selectDepartmentList()throws Exception;
	
	List<DepartmentVO> selectSearchDepartmentList(SearchCriteria cri)throws Exception;
	
	
	DepartmentVO selectDepartmentById(String dep_no)throws Exception;
	void insertDepartment(DepartmentVO department)throws Exception;
	
	void updateDepartment(DepartmentVO department)throws Exception;
	
	void deleteDepartment(String dep_no)throws Exception;
	
	int selectDepartmentCount(SearchCriteria cri)throws Exception;
}
