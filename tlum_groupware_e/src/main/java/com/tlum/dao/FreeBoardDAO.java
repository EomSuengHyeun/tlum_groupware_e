package com.tlum.dao;

import java.util.List;

import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardVO;
import com.tlum.dto.SearchCriteria;

public interface FreeBoardDAO {
	
	public List<FreeBoardVO> selectFreeBoardList()throws Exception;
	public FreeBoardVO selectFreeBoardById(String free_board_bno)throws Exception;
	
	public void insertFreeBoard(FreeBoardVO freeBoard)throws Exception;
	public void updateFreeBoard(FreeBoardVO freeBoard)throws Exception;
	public void deleteFreeBoard(String free_board_bno)throws Exception;
	
	//페이징
	public List<FreeBoardVO> selectFreeBoardCriteria(Criteria cri)throws Exception;
	//서치페이징
	List<FreeBoardVO> selectSearchFreeBoardList(SearchCriteria cri)throws Exception;
	int selectSearchFreeBoardCount(SearchCriteria cri)throws Exception;
	
}
