package com.tlum.dao;

import java.util.List;

import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardReplyVO;

public interface FreeBoardReplyDAO {
	
	List<FreeBoardReplyVO> selectReplyList(String free_board_bno)throws Exception;
	void insertReply(FreeBoardReplyVO freeBoardReply)throws Exception;
	void deleteReply(String reply_no)throws Exception;
	
	List<FreeBoardReplyVO> selectReplyListPage(String free_board_bno,Criteria cri)throws Exception;
	int countReply(String free_board_bno)throws Exception;

}
