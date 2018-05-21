package com.tlum.service;

import java.util.List;

import com.tlum.dao.LimitBoardReplyDAO;
import com.tlum.dto.Criteria;
import com.tlum.dto.LimitBoardReplyVO;

public class LimitBoardReplyServiceImpl implements LimitBoardReplyService {

	private LimitBoardReplyDAO limitBoardReplyDAO;

	public LimitBoardReplyDAO getLimitBoardReplyDAO() {
		return limitBoardReplyDAO;
	}

	public void setLimitBoardReplyDAO(LimitBoardReplyDAO limitBoardReplyDAO) {
		this.limitBoardReplyDAO = limitBoardReplyDAO;
	}

	@Override
	public List<LimitBoardReplyVO> selectLimitBoardReplyList(String limit_board_bno) throws Exception {
		return limitBoardReplyDAO.selectLimitBoardReplyList(limit_board_bno);
	}

	@Override
	public void insertLimitBoardReply(LimitBoardReplyVO limitBoardReply) throws Exception {
		limitBoardReplyDAO.insertLimitBoardReply(limitBoardReply);

	}

	@Override
	public void deleteLimitBoardReply(String reply_no) throws Exception {
		limitBoardReplyDAO.deleteLimitBoardReply(reply_no);

	}

	@Override
	public List<LimitBoardReplyVO> selectLimitBoardReplyListPage(String limit_board_bno, Criteria cri)
			throws Exception {
		return limitBoardReplyDAO.selectLimitBoardReplyListPage(limit_board_bno, cri);
	}

	@Override
	public int countReply(String limit_board_bno) throws Exception {
		return limitBoardReplyDAO.countReply(limit_board_bno);
	}

}
