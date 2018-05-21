package com.tlum.dao;

import java.util.ArrayList;
import java.util.List;

import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.DepartmentVO;
import com.tlum.dto.SearchCriteria;

public class DepartmentDAOImpl implements DepartmentDAO {
	
	
	private SqlSession session;
	
	public SqlSession getSession() {
		return session;
	}

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	private static final String NAMESPACE="departmentMapper";
	
	private List<DepartmentVO> departmentList=new ArrayList<DepartmentVO>();


	@Override
	public List<DepartmentVO> selectDepartmentList() throws Exception {
		departmentList=session.selectList(NAMESPACE+".selectDepartmentList");
		return departmentList;
	}

	
	@Override
	public List<DepartmentVO> selectSearchDepartmentList(SearchCriteria cri) throws Exception {
		departmentList = session.selectList(NAMESPACE+".selectSearchDepartmentList",cri);
		return departmentList;
	}

	@Override
	public void insertDepartment(DepartmentVO department) throws Exception {
		session.update(NAMESPACE+".insertDepartment",department);

	}

	@Override
	public void updateDepartment(DepartmentVO department) throws Exception {
		session.update(NAMESPACE+".updateDepartment",department);
	}

	@Override
	public void deleteDepartment(String dep_no) throws Exception {
		session.update(NAMESPACE+".deleteDepartment",dep_no);
	}

	@Override
	public int selectDepartmentCount(SearchCriteria cri) throws Exception {
		int count=(Integer)session.selectOne(NAMESPACE+".selectDepartmentCount",cri);
		return count;
	}

	@Override
	public DepartmentVO selectDepartmentById(String dep_no) throws Exception {
		DepartmentVO department=(DepartmentVO)session.selectOne(NAMESPACE+".selectDepartmentById",dep_no);
		return department;
	}
}
