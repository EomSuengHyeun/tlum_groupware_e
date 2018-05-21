package com.tlum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.CalenderVO;
import com.tlum.dto.RabelVO;

public class RabelDAOImpl implements RabelDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	private static final String NAMESPACE = "RabelMapper";
	

	@Override
	public void insertRabel(RabelVO rabel) throws Exception {
		System.out.println(rabel);
		try{
			session.update(NAMESPACE+".insertRabel",rabel);
		}catch(Exception e){
			e.printStackTrace();
		}
	}


	@Override
	public List<RabelVO> selectRabel(String emp_id) throws Exception {
		List<RabelVO> rabelList = session.selectList(NAMESPACE+".selectRabelByID", emp_id);
		return rabelList;
	}

}
