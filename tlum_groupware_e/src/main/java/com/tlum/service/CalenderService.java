package com.tlum.service;


import com.tlum.dto.CalenderVO;

public interface CalenderService {
	public void insertCalender(CalenderVO calender) throws Exception;
	public CalenderVO selcetCal(String cal_no)throws Exception;
	public void deleteCal(String cal_no)throws Exception;
	public void modifyCal(CalenderVO calender)throws Exception;
}
