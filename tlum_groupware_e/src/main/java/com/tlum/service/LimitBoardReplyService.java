package com.tlum.service;

import java.util.List;

import com.tlum.dto.Criteria;
import com.tlum.dto.LimitBoardReplyVO;

public interface LimitBoardReplyService {

	List<LimitBoardReplyVO> selectLimitBoardReplyList(String limit_board_bno) throws Exception;
	void insertLimitBoardReply(LimitBoardReplyVO limitBoardReply) throws Exception;
	void deleteLimitBoardReply(String reply_no) throws Exception;
	
	List<LimitBoardReplyVO> selectLimitBoardReplyListPage(String limit_board_bno, Criteria cri) throws Exception;
	int countReply(String limit_board_bno) throws Exception;

}
