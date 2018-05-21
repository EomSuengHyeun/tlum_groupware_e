package com.tlum.service;

import java.util.List;

import com.tlum.dto.MsgReceiveVO;
import com.tlum.dto.MsgSendVO;
import com.tlum.dto.SearchCriteria;

public interface MsgReceiveService {
	
	public List<MsgReceiveVO> selectMsgReceiveList(SearchCriteria cri,String emp_id)throws Exception;
	int MsgReceiveCount(SearchCriteria cri,String emp_id)throws Exception;
	public MsgReceiveVO selectMsgReceiveById(String msg_no)throws Exception;
	public void insertMsgReceive(MsgSendVO msgSend)throws Exception;
	public void deleteMsgReceive(String msg_no)throws Exception;

}
