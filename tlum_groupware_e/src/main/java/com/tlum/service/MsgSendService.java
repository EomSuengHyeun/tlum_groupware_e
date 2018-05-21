package com.tlum.service;

import java.util.List;

import com.tlum.dto.EmployeeVO;
import com.tlum.dto.MsgSendVO;
import com.tlum.dto.SearchCriteria;

public interface MsgSendService {
	
	public List<MsgSendVO> selectMsgSendList(SearchCriteria cri,String emp_id)throws Exception;
	int MsgSendCount(SearchCriteria cri,String emp_id)throws Exception;
	public MsgSendVO selectMsgSendById(String msg_no)throws Exception;
	public void insertMsgSend(MsgSendVO msgSend)throws Exception;
	public void deleteMsgSend(String msg_no)throws Exception;
	
	public void deleteMsgSendList(String msg_noList) throws Exception;

}
