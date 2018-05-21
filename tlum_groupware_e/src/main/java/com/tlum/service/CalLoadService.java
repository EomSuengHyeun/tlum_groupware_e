package com.tlum.service;

import java.util.List;

import com.tlum.dto.CalLoadDTO;

public interface CalLoadService {
	public List<CalLoadDTO>  selectListByID(String emp_id) throws Exception;
}
