package com.tlum.dao;


import com.tlum.dto.CalenderVO;

public interface CalenderDAO {
	public void insertCalender(CalenderVO calender) throws Exception;
	public CalenderVO selectCal(String cal_no) throws Exception;
	public void modifyCalender(CalenderVO calender)throws Exception;
	public void deleteCalender(String cal_no)throws Exception;
}
