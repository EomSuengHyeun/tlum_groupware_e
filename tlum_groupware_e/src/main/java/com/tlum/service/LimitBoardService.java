package com.tlum.service;

import java.util.List;

import com.tlum.dto.Criteria;
import com.tlum.dto.LimitBoardVO;
import com.tlum.dto.SearchCriteria;

public interface LimitBoardService {

	public List<LimitBoardVO> selectLimitBoardList() throws Exception;
	public LimitBoardVO selectLimitBoardById(String limit_board_bno) throws Exception;
	public void updateLimitBoard(LimitBoardVO limitBoard) throws Exception;
	public void insertLimitBoard(LimitBoardVO limitBoard) throws Exception;
	public void deleteLimitBoard(String limit_board_bno) throws Exception;

	public List<LimitBoardVO> selectLimitBoardListCriteria(Criteria cri) throws Exception;
	public List<LimitBoardVO> selectSearchLimitBoardList(SearchCriteria cri) throws Exception;
	int selectSearchLimitBoardCount(SearchCriteria cri) throws Exception;
	
}
