package com.tlum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.MsgSendVO;
import com.tlum.dto.SearchCriteria;

public class MsgSendDAOImpl implements MsgSendDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	private List<MsgSendVO> msgSend=new ArrayList<MsgSendVO>();
	
	
	private static final String NAMESPACE="MsgSendMapper";

	@Override
	public List<MsgSendVO> selectSearchMsgSendList(SearchCriteria cri,String emp_id)throws Exception{
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("cri",cri);
		map.put("emp_id",emp_id);
		int offset=cri.getPageStart();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
	
		List<MsgSendVO> msgSendList=new ArrayList<MsgSendVO>();
		
		msgSendList=session.selectList(NAMESPACE+".selectSearchMsgSendList",map,rowBounds);
	
		return msgSendList;
	}

	@Override
	public MsgSendVO selectMsgSendById(String msg_no) throws Exception {
		MsgSendVO msgSend =(MsgSendVO)session.selectOne(NAMESPACE+".selectMsgSendById",msg_no);
		return msgSend;
	}

	@Override
	public void insertMsgSend(MsgSendVO msgSend) throws Exception {
		session.update(NAMESPACE+".insertMsgSend",msgSend);

	}

	@Override
	public void deleteMsgSend(String msg_no) throws Exception {
		session.update(NAMESPACE+".deleteMsgSend",msg_no);

	}

	@Override
	public int selectSearcMsgSendCount(SearchCriteria cri,String emp_id) throws Exception {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("cri",cri);
		map.put("emp_id",emp_id);
		int listCount=(Integer)session.selectOne(NAMESPACE+".selectSearchMsgSendListCount",map);
		return listCount;
	}

	

}
