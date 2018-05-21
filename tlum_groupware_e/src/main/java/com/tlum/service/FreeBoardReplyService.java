package com.tlum.service;

import java.util.List;

import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardReplyVO;

public interface FreeBoardReplyService {
	
	List<FreeBoardReplyVO> FreeBoardReplyList(String free_board_bno)throws Exception;
	void insertFreeBoardReply(FreeBoardReplyVO freeBoardReply)throws Exception;
	void deleteFreeBoardReply(String reply_no)throws Exception;
	
	List<FreeBoardReplyVO> FreeBoardReplyListPage(String free_board_bno,Criteria cri)throws Exception;
	int countReply(String free_board_bno)throws Exception;
 
}
