package com.tlum.service;

import java.util.List;

import com.tlum.dao.RabelDAO;
import com.tlum.dto.RabelVO;

public class RabelServiceImpl implements RabelService{
private RabelDAO rabelDAO;
	
	public void setRabelDAO(RabelDAO rabelDAO){
		this.rabelDAO=rabelDAO;
	}
	
	public RabelDAO getRabelDAO() {
		return rabelDAO;
	}

	@Override
	public void insertRabel(RabelVO rabel) throws Exception {
		rabelDAO.insertRabel(rabel);
		
	}

	@Override
	public List<RabelVO> selectRabel(String emp_id) throws Exception {
		List<RabelVO> rabelList = rabelDAO.selectRabel(emp_id);
		return rabelList;
	}

}
