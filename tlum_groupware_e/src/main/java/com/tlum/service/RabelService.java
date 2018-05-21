package com.tlum.service;

import java.util.List;

import com.tlum.dto.CalenderVO;
import com.tlum.dto.RabelVO;

public interface RabelService {
	public void insertRabel(RabelVO rabel)throws Exception;
	public List<RabelVO> selectRabel(String emp_id)throws Exception;
}
