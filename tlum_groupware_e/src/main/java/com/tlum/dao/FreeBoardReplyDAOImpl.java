package com.tlum.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardReplyVO;

public class FreeBoardReplyDAOImpl implements FreeBoardReplyDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session){
		this.session=session;
		
	}
	
	private String namespace;
	public void setNamespace(String namespace){
		this.namespace=namespace;
	}

	@Override
	public List<FreeBoardReplyVO> selectReplyList(String free_board_bno) throws Exception {
		List<FreeBoardReplyVO> replyList=session.selectList(namespace+".selectFreeBoardReplyList",free_board_bno);
		return replyList;
	}

	@Override
	public void insertReply(FreeBoardReplyVO freeBoardReply) throws Exception {
		System.out.println("freeBoardReplyDAO"+freeBoardReply);
		session.update(namespace+".insertFreeBoardReply",freeBoardReply);

	}

	@Override
	public void deleteReply(String reply_no) throws Exception {
		session.update(namespace+".deleteFreeBoardReply",reply_no);
	}

	@Override
	public List<FreeBoardReplyVO> selectReplyListPage(String free_board_bno, Criteria cri) throws Exception {
		System.out.println("AAAAAAAA");
		int offset=cri.getPageStart();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<FreeBoardReplyVO> replyList=session.selectList(namespace+".selectFreeBoardReply",free_board_bno,rowBounds);
		return replyList;
	}

	@Override
	public int countReply(String free_board_bno) throws Exception {
		int count=(Integer)session.selectOne(namespace+".countReply",free_board_bno);
		return count;
	}

}
