package com.tlum.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.AppVO;
import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardVO;
import com.tlum.dto.SearchCriteria;

public class AppDAOImpl implements AppDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	private List<AppVO> AppList = new ArrayList<AppVO>();

	private static final String NAMESPACE = "AppMapper";

	
	@Override
	public List<AppVO> selectAppList() {
		AppList = session.selectList(NAMESPACE+".selectAppList");
		return AppList;
	}

	@Override
	public AppVO selectAppByNo(String app_no) throws Exception {
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


	@Override
	public List<FreeBoardVO> selectAppCriteria(Criteria cri) throws Exception {
		int page=cri.getPage();
		int perPageNum=cri.getPerPageNum();
		
		int offset=(page-1)*perPageNum;
		int limit=perPageNum;
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<FreeBoardVO> FreeBoardList=session.selectList(NAMESPACE+".selectFreeBoardList",null,rowBounds);
		return FreeBoardList;
	}

	@Override
	public List<FreeBoardVO> selectSearchAppList(SearchCriteria cri) throws Exception {
		int offset=cri.getPageStart();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<FreeBoardVO> boardList=session.selectList(NAMESPACE+".selectSearchFreeBoardList",cri,rowBounds);
		return boardList;
	}
	

}
