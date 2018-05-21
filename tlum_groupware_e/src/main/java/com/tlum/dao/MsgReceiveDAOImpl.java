package com.tlum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.MsgReceiveVO;
import com.tlum.dto.MsgSendVO;
import com.tlum.dto.SearchCriteria;

public class MsgReceiveDAOImpl implements MsgReceiveDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	private List<MsgReceiveVO> msgReceiveList=new ArrayList<MsgReceiveVO>();
	
	private static final String NAMESPACE="MsgReceiveMapper";


	@Override
	public List<MsgReceiveVO> selectSearchMsgReceive(SearchCriteria cri,String emp_id) throws Exception {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("cri",cri);
		map.put("emp_id",emp_id);
		int offset=cri.getPageStart();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
	    List<MsgReceiveVO> msgReceiveList = session.selectList(NAMESPACE+".selectSearchMsgReceiveList",map,rowBounds);
		return msgReceiveList;
	}

	@Override
	public MsgReceiveVO selectMsgReceiveById(String msg_no) throws Exception {
		MsgReceiveVO msgReceive =(MsgReceiveVO)session.selectOne(NAMESPACE+".selectMsgReceiveById",msg_no);
		return msgReceive;
	}

	@Override
	public void insertMsgReceive(MsgReceiveVO msgReceive) throws Exception {
		session.update(NAMESPACE+".insertMsgReceive",msgReceive);

	}

	@Override
	public void deleteMsgReceive(String msg_no) throws Exception {
		session.update(NAMESPACE+".deleteMsgReceive",msg_no);

	}

	@Override
	public int selectSearcMsgSendCount(SearchCriteria cri,String emp_id) throws Exception {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("cri",cri);
		map.put("emp_id",emp_id);
		int listCount=(Integer)session.selectOne(NAMESPACE+".selectSearchMsgReceiveListCount",map);
		return listCount;
	}

}
