package com.tlum.dao;

import java.util.List;

import com.tlum.dto.RabelVO;

public interface RabelDAO {
	public void insertRabel(RabelVO rabel)throws Exception;
	public List<RabelVO> selectRabel(String emp_id)throws Exception;
}
