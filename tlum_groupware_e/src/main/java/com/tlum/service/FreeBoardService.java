package com.tlum.service;

import java.util.List;

import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardVO;
import com.tlum.dto.SearchCriteria;

public interface FreeBoardService {
	
	public List<FreeBoardVO> selectFreeBoardList()throws Exception;
	public FreeBoardVO selectFreeBoardById(String free_board_bno)throws Exception;
	public void insertFreeBoard(FreeBoardVO freeBoard)throws Exception;
	public void updateFreeBoard(FreeBoardVO freeBoard)throws Exception;
	public void deleteFreeBoard(String free_board_bno)throws Exception;
	
	//서치
	public List<FreeBoardVO> selectFreeBoardListCriteria(Criteria cri) throws Exception;
	public List<FreeBoardVO> selectSearchFreeBoardList(SearchCriteria cri)throws Exception;
	int freeBoardCount(SearchCriteria cri)throws Exception;
	
	
}
