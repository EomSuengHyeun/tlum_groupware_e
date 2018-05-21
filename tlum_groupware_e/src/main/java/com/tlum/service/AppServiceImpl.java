package com.tlum.service;

import java.util.List;

import com.tlum.dao.AppDAO;
import com.tlum.dao.EmployeeDAO;
import com.tlum.dto.AppVO;
import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardVO;
import com.tlum.dto.SearchCriteria;

public class AppServiceImpl implements AppService{

	private AppDAO appDAO;
	public AppDAO getAppDAO() {
		return appDAO;
	}
	public void setAppDAO(AppDAO appDAO) {
		this.appDAO = appDAO;
	}
	

	@Override
	public List<AppVO> selectAppList() {
		List<AppVO> appList=appDAO.selectAppList();
		return appList;
	}
	
	@Override
	public AppVO selectAppById(String app_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void insertApp(AppVO app) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void updateApp(AppVO app) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteApp(String app_no) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
