package com.tlum.service;


import com.tlum.dao.CalenderDAO;
import com.tlum.dto.CalenderVO;

public class CalenderServiceImpl implements CalenderService{
private CalenderDAO calenderDAO;
	
	public void setCalenderDAO(CalenderDAO calenderDAO){
		this.calenderDAO=calenderDAO;
	}
	
	public CalenderDAO getCalenderDAO() {
		return calenderDAO;
	}

	@Override
	public void insertCalender(CalenderVO calender) throws Exception {
		calenderDAO.insertCalender(calender);
	}

	@Override
	public CalenderVO selcetCal(String cal_no) throws Exception {
		CalenderVO cal =null;
		cal = calenderDAO.selectCal(cal_no);
		return cal;
	}

	@Override
	public void deleteCal(String cal_no) throws Exception {
		calenderDAO.deleteCalender(cal_no);
	}

	@Override
	public void modifyCal(CalenderVO calender) throws Exception {
		calenderDAO.modifyCalender(calender);
	}

}
