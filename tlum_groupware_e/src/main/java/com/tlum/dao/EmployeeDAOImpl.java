package com.tlum.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.EmployeeVO;
import com.tlum.dto.SearchCriteria;

public class EmployeeDAOImpl implements EmployeeDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	private List<EmployeeVO> employeeList = new ArrayList<EmployeeVO>();

	private static final String NAMESPACE = "EmployeeMapper";

	@Override
	public List<EmployeeVO> selectEmployeeList()throws Exception{
		
			employeeList = session.selectList(NAMESPACE + ".selectEmployeeList");
		
		return employeeList;
	}

	@Override
	public EmployeeVO selectEmployeeById(String emp_id) throws Exception {
		EmployeeVO employ = (EmployeeVO)session.selectOne(NAMESPACE+".selectEmployeeById",emp_id);
		return employ;
	}

	@Override
	public void insertEmployee(EmployeeVO employee) throws Exception {
		
		try{
		session.update(NAMESPACE+".insertEmployee",employee);
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}
	@Override
	public void insertEmployeePic(EmployeeVO employee) throws Exception {
		session.update(NAMESPACE+".insertEmployeePic",employee);
		
	}

	@Override
	public void updateEmployee(EmployeeVO employee) throws Exception {
		session.update(NAMESPACE+".updateEmployee",employee);

	}
	@Override
	public void updateEmployeePic(EmployeeVO employee) throws Exception {
		session.update(NAMESPACE+".updateEmployeePic",employee);
		
	}

	@Override
	public void deleteEmployee(String emp_id) throws Exception {
		session.update(NAMESPACE+".deleteEmployee",emp_id);
		
	}

	@Override
	public List<EmployeeVO> selectEmployeeListByDepNo(String dep_no) throws Exception {
		employeeList = session.selectList(NAMESPACE + ".selectEmployeeListByDepNo",dep_no);
		return employeeList;
	}

	@Override
	public int selectLogin(EmployeeVO employee) throws Exception {
		int empLoginChk =(Integer)session.selectOne(NAMESPACE+".empLogin",employee);
		
		return empLoginChk;
	}
	@Override
	public List<EmployeeVO> selectSearchEmp(SearchCriteria cri) throws Exception {
		int offset=cri.getPageStart();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<EmployeeVO> empSearch = session.selectList(NAMESPACE+".selectEmployeeList",cri,rowBounds);
		return empSearch;
	}

	



}
