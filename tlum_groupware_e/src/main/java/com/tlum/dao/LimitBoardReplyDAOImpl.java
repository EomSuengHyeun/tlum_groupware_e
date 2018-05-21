package com.tlum.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.Criteria;
import com.tlum.dto.LimitBoardReplyVO;
import com.tlum.dto.LimitBoardVO;

public class LimitBoardReplyDAOImpl implements LimitBoardReplyDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	
	private String namespace; 
	public void setNamespace(String namespace){
		this.namespace=namespace; 
	}
	 
	//private static final String NAMESPACE = "LimitBoardReplyMapper";

	@Override
	public List<LimitBoardReplyVO> selectLimitBoardReplyList(String limit_board_bno) throws Exception {
		List<LimitBoardReplyVO> limitBoardReplyList = session.selectList(namespace + ".selectLimitBoardReplyList",
				limit_board_bno);
		return limitBoardReplyList;
	}

	@Override
	public void insertLimitBoardReply(LimitBoardReplyVO limitBoardReply) throws Exception {
		System.out.println(limitBoardReply); 
		session.update(namespace + ".insertLimitBoardReply", limitBoardReply);

	}

	@Override
	public void deleteLimitBoardReply(String reply_no) throws Exception {
		session.update(namespace + ".deleteLimitBoardReply", reply_no);

	}

	@Override
	public List<LimitBoardReplyVO> selectLimitBoardReplyListPage(String limit_board_bno, Criteria cri)
			throws Exception {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<LimitBoardReplyVO> limitBoardReplyList = session.selectList(namespace + ".selectLimitBoardReplyList",
				limit_board_bno, rowBounds);
		return limitBoardReplyList;
	}

	@Override
	public int countReply(String limit_board_bno) throws Exception {
		int count=(Integer)session.selectOne(namespace+".selectSearchLimitBoardReplyCount",limit_board_bno);
		return count;
	}

}
