package com.tlum.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.tlum.dto.AppVO;
import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardVO;
import com.tlum.dto.SearchCriteria;


public interface AppDAO {

	public List<AppVO> selectAppList();
	public AppVO selectAppByNo(String app_no)throws Exception;
	public void insertApp(AppVO app) throws Exception;
	public void updateApp(AppVO app)throws Exception;
	public void deleteApp(String app_no)throws Exception;

	

	//서치/페이징
	public List<FreeBoardVO> selectAppCriteria(Criteria cri)throws Exception;
	List<FreeBoardVO> selectSearchAppList(SearchCriteria cri)throws Exception;
	
	
}
