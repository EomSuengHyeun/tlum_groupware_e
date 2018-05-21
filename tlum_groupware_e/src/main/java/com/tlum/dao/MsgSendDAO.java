package com.tlum.dao;

import java.util.List;

import com.tlum.dto.EmployeeVO;
import com.tlum.dto.MsgSendVO;
import com.tlum.dto.SearchCriteria;

public interface MsgSendDAO {
	
	public List<MsgSendVO> selectSearchMsgSendList(SearchCriteria cri,String emp_id)throws Exception;
	public MsgSendVO selectMsgSendById(String msg_no)throws Exception;
	
	public void insertMsgSend(MsgSendVO msgSend)throws Exception;
	public void deleteMsgSend(String msg_no)throws Exception;
	
	int selectSearcMsgSendCount(SearchCriteria cri,String emp_id)throws Exception;
	

}
