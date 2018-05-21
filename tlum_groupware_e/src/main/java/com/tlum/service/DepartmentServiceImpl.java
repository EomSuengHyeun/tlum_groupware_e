package com.tlum.service;

import java.util.List;

import com.tlum.dao.DepartmentDAO;
import com.tlum.dto.DepartmentVO;
import com.tlum.dto.SearchCriteria;

public class DepartmentServiceImpl implements DepartmentService{
	
	private DepartmentDAO departmentDAO;
	
	public DepartmentDAO getDepartmentDAO() {
		return departmentDAO;
	}

	public void setDepartmentDAO(DepartmentDAO departmentDAO) {
		this.departmentDAO = departmentDAO;
	}

	@Override
	public List<DepartmentVO> selectDepartmentList() throws Exception {
		
		return departmentDAO.selectDepartmentList();
	}
	
	@Override
	public List<DepartmentVO> selectSearchDepartmentList(SearchCriteria cri) throws Exception {
		List<DepartmentVO> department=departmentDAO.selectSearchDepartmentList(cri);
		return department;
	}

	@Override
	public int selectDepartmentCount(SearchCriteria cri) throws Exception {
		int count=departmentDAO.selectDepartmentCount(cri);
		return count;
	}

	@Override
	public DepartmentVO selectDepartmentById(String dep_no) throws Exception {
		DepartmentVO department=departmentDAO.selectDepartmentById(dep_no);
		return department;
	}
	@Override
	public void insertDepartment(DepartmentVO department) throws Exception {
		departmentDAO.insertDepartment(department);
		
	}

	@Override
	public void updateDepartment(DepartmentVO department) throws Exception {
		departmentDAO.updateDepartment(department);
		
	}

	@Override
	public void deleteDepartment(String dep_no) throws Exception {
		departmentDAO.deleteDepartment(dep_no);
		
	}


}
