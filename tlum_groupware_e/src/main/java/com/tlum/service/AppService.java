package com.tlum.service;

import java.util.List;

import com.tlum.dto.AppVO;


public interface AppService {

	public List<AppVO> selectAppList()throws Exception;
	public AppVO selectAppById(String app_no)throws Exception;
	public void insertApp(AppVO app)throws Exception; 
	public void updateApp(AppVO app)throws Exception;
	public void deleteApp(String app_no)throws Exception;
	

}
