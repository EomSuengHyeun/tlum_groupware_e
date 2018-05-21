package com.tlum.service;

import java.util.List;

import com.tlum.dao.CalLoadDAO;
import com.tlum.dto.CalLoadDTO;

public class CalLoadServiceImpl implements CalLoadService{
private CalLoadDAO calLoadDAO;
	
	public void setCalenderDAO(CalLoadDAO calLoadDAO){
		this.calLoadDAO=calLoadDAO;
	}
	
	public CalLoadDAO getCalLoadDAO() {
		return calLoadDAO;
	}

	@Override
	public List<CalLoadDTO> selectListByID(String emp_id) throws Exception {
		List<CalLoadDTO> calLoadList = calLoadDAO.selectListByID(emp_id);
		return calLoadList;
	}

}
