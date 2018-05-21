package com.tlum.service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import com.tlum.dao.MsgReceiveDAO;
import com.tlum.dto.MsgReceiveVO;
import com.tlum.dto.MsgSendVO;
import com.tlum.dto.SearchCriteria;

public class MsgReceiveServiceImpl implements MsgReceiveService {
	
	private MsgReceiveDAO msgReceiveDAO;
	

	public MsgReceiveDAO getMsgReceiveDAO() {
		return msgReceiveDAO;
	}

	public void setMsgReceiveDAO(MsgReceiveDAO msgReceiveDAO) {
		this.msgReceiveDAO = msgReceiveDAO;
	}

	@Override
	public List<MsgReceiveVO> selectMsgReceiveList(SearchCriteria cri,String emp_id) throws Exception {
		List<MsgReceiveVO> msgReceive=msgReceiveDAO.selectSearchMsgReceive(cri,emp_id);
		return msgReceive;
	}

	@Override
	public int MsgReceiveCount(SearchCriteria cri,String emp_id) throws Exception {
		int count=msgReceiveDAO.selectSearcMsgSendCount(cri,emp_id);
		return count;
	}

	@Override
	public MsgReceiveVO selectMsgReceiveById(String msg_no) throws Exception {
		MsgReceiveVO msgReceive=msgReceiveDAO.selectMsgReceiveById(msg_no);
		return msgReceive;
	}

	@Override
	public void insertMsgReceive(MsgSendVO msgSend) throws Exception {
		MsgReceiveVO saveVO;
		List<MsgReceiveVO> MsgReceiveList=new ArrayList<MsgReceiveVO>();
		StringTokenizer sendIdToken = new StringTokenizer(msgSend.getReceive_id(),"/");
		StringTokenizer sendNameToken = new StringTokenizer(msgSend.getReceive_name(),"/");
		String [] sendIdArr = new String[sendIdToken.countTokens()];
		String [] sendNameArr = new String[sendNameToken.countTokens()];
		int x =0;
		
		while(sendIdToken.hasMoreTokens()){
			sendIdArr[x++] = sendIdToken.nextToken().trim();
		}
		x=0;
		while(sendNameToken.hasMoreTokens()){
			sendNameArr[x++] = sendNameToken.nextToken().trim();
		}
		
		for(int i=0;i<sendIdArr.length;i++){
			saveVO=new MsgReceiveVO();
			saveVO.setSend_id(msgSend.getEmp_id());
			saveVO.setSend_name(sendNameArr[i]);
			saveVO.setEmp_id(sendIdArr[i]);
			saveVO.setMsg_content(msgSend.getMsg_content());
			saveVO.setMsg_file_name(msgSend.getMsg_file_name());
			saveVO.setMsg_title(msgSend.getMsg_title());
			saveVO.setMsg_view("0");
			MsgReceiveList.add(saveVO);
		}
		
		for(MsgReceiveVO msgReceiveVO:MsgReceiveList){
			msgReceiveDAO.insertMsgReceive(msgReceiveVO);
		}

	}

	@Override
	public void deleteMsgReceive(String msg_no) throws Exception {
		msgReceiveDAO.deleteMsgReceive(msg_no);

	}

}
