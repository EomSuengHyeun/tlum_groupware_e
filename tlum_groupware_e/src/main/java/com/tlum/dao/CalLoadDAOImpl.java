package com.tlum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.CalLoadDTO;


public class CalLoadDAOImpl implements CalLoadDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	private static final String NAMESPACE = "CalLoadMapper";

	@Override
	public List<CalLoadDTO> selectListByID(String emp_id) throws Exception {
		List<CalLoadDTO> calLoadList =  session.selectList(NAMESPACE + ".selectListByID", emp_id);
		return calLoadList;
	}
}
