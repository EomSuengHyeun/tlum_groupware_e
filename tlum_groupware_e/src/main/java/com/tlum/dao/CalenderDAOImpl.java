package com.tlum.dao;


import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.CalenderVO;

public class CalenderDAOImpl implements CalenderDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	private static final String NAMESPACE = "CalenderMapper";

	@Override
	public void insertCalender(CalenderVO calender) throws Exception {
		session.update(NAMESPACE+".insertCalender",calender);
		System.out.println(calender);
	}

	@Override
	public CalenderVO selectCal(String cal_no) throws Exception {
		CalenderVO cal = null;
		cal = (CalenderVO) session.selectOne(NAMESPACE+".selectCalender", cal_no);
		return cal;
	}

	@Override
	public void modifyCalender(CalenderVO calender) throws Exception {
		session.update(NAMESPACE+".modifyCalender",calender);
		
	}

	@Override
	public void deleteCalender(String cal_no) throws Exception {
		session.update(NAMESPACE+".deleteCalender",cal_no);
	}
	

}
