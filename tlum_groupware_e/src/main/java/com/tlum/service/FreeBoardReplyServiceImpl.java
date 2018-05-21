package com.tlum.service;

import java.util.List;

import com.tlum.dao.FreeBoardReplyDAO;
import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardReplyVO;

public class FreeBoardReplyServiceImpl implements FreeBoardReplyService {
	
	private FreeBoardReplyDAO dao;
	public FreeBoardReplyDAO getDao() {
		return dao;
	}

	public void setDao(FreeBoardReplyDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<FreeBoardReplyVO> FreeBoardReplyList(String free_board_bno) throws Exception {
		return dao.selectReplyList(free_board_bno);
	}

	@Override
	public void insertFreeBoardReply(FreeBoardReplyVO freeBoardReply) throws Exception {
		dao.insertReply(freeBoardReply);

	}

	@Override
	public void deleteFreeBoardReply(String reply_no) throws Exception {
		dao.deleteReply(reply_no);

	}

	@Override
	public List<FreeBoardReplyVO> FreeBoardReplyListPage(String free_board_bno, Criteria cri) throws Exception {
		return dao.selectReplyListPage(free_board_bno, cri);
	}

	@Override
	public int countReply(String free_board_bno) throws Exception {
		return dao.countReply(free_board_bno);
	}

}
