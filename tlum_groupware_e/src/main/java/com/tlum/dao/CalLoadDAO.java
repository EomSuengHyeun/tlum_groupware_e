package com.tlum.dao;

import java.util.List;

import com.tlum.dto.CalLoadDTO;

public interface CalLoadDAO {
	public List<CalLoadDTO> selectListByID(String emp_id) throws Exception;
}
