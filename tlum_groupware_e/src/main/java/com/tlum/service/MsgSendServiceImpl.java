package com.tlum.service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import com.tlum.dao.MsgSendDAO;
import com.tlum.dto.EmployeeVO;
import com.tlum.dto.MsgSendVO;
import com.tlum.dto.SearchCriteria;

public class MsgSendServiceImpl implements MsgSendService {
	
	private MsgSendDAO msgSendDAO;
	

	public void setMsgSendDAO(MsgSendDAO msgSendDAO) {
		this.msgSendDAO = msgSendDAO;
	}
	

	public MsgSendDAO getMsgSendDAO() {
		return msgSendDAO;
	}


	@Override
	public List<MsgSendVO> selectMsgSendList(SearchCriteria cri,String emp_id) throws Exception {
		List<MsgSendVO> msgSend=msgSendDAO.selectSearchMsgSendList(cri,emp_id);
		return msgSend;
	}

	@Override
	public int MsgSendCount(SearchCriteria cri,String emp_id) throws Exception {
		int count=msgSendDAO.selectSearcMsgSendCount(cri,emp_id);
		return count;
	}

	@Override
	public MsgSendVO selectMsgSendById(String msg_no) throws Exception {
		MsgSendVO msgSend=msgSendDAO.selectMsgSendById(msg_no);
		return msgSend;
	}

	@Override
	public void insertMsgSend(MsgSendVO msgSend) throws Exception {
		msgSend.setMsg_view("0");
		msgSendDAO.insertMsgSend(msgSend);
		
	}

	@Override
	public void deleteMsgSend(String msg_no) throws Exception {
		msgSendDAO.deleteMsgSend(msg_no);

	}
	@Override
	public void deleteMsgSendList(String msg_noList) throws Exception {

		StringTokenizer msg_noToken = new StringTokenizer(msg_noList,"/");
		String [] msgNoArr=new String[msg_noToken.countTokens()];
		int i=0;
		while(msg_noToken.hasMoreTokens()){
			msgNoArr[i++]=msg_noToken.nextToken().trim();
		}
		for(int x=0;x<msgNoArr.length;x++){
			System.out.println(msgNoArr[x]);
			msgSendDAO.deleteMsgSend(msgNoArr[x]);
		}
	}

	

	

}
