package com.tlum.dao;

import java.util.List;

import com.tlum.dto.MsgReceiveVO;
import com.tlum.dto.SearchCriteria;

public interface MsgReceiveDAO {
	
	public List<MsgReceiveVO> selectSearchMsgReceive(SearchCriteria cri,String emp_id)throws Exception;
	public MsgReceiveVO selectMsgReceiveById(String msg_no)throws Exception;
	
	public void insertMsgReceive(MsgReceiveVO msgReceive)throws Exception;
	public void deleteMsgReceive(String msg_no)throws Exception;
	
	int selectSearcMsgSendCount(SearchCriteria cri,String emp_id)throws Exception;

}
