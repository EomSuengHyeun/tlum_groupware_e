package com.tlum.service;

import java.util.List;

import com.tlum.dao.LimitBoardDAO;
import com.tlum.dto.Criteria;
import com.tlum.dto.LimitBoardVO;
import com.tlum.dto.SearchCriteria;

public class LimitBoardServiceImpl implements LimitBoardService {

	private LimitBoardDAO limitBoardDAO;

	public void setLimitBoardDAO(LimitBoardDAO limitBoardDAO) {
		this.limitBoardDAO = limitBoardDAO;
	}

	public LimitBoardDAO getLimitBoardDAO() {
		return limitBoardDAO;
	}

	@Override
	public List<LimitBoardVO> selectLimitBoardList() throws Exception {
		List<LimitBoardVO> limitBoard = limitBoardDAO.selectLimitBoardList();
		return limitBoard;
	}

	@Override
	public LimitBoardVO selectLimitBoardById(String limit_board_bno) throws Exception {
		LimitBoardVO limitBoard = limitBoardDAO.selectLimitBoardById(limit_board_bno);
		return limitBoard;
	}

	@Override
	public void updateLimitBoard(LimitBoardVO limitBoard) throws Exception {
		limitBoardDAO.updateLimitBoard(limitBoard);
	}

	@Override
	public void insertLimitBoard(LimitBoardVO limitBoard) throws Exception {
		limitBoardDAO.insertLimitBoard(limitBoard);
	}

	@Override
	public void deleteLimitBoard(String limit_board_bno) throws Exception {
		limitBoardDAO.deleteLimitBoard(limit_board_bno);
	}

	@Override
	public List<LimitBoardVO> selectLimitBoardListCriteria(Criteria cri) throws Exception {
		List<LimitBoardVO> limitBoard = limitBoardDAO.selectLimitBoardListCriteria(cri);
		return limitBoard;
	}

	@Override
	public List<LimitBoardVO> selectSearchLimitBoardList(SearchCriteria cri) throws Exception {
		List<LimitBoardVO> limitBoardSearch = limitBoardDAO.selectSearchLimitBoardList(cri);
		return limitBoardSearch;
	}

	@Override
	public int selectSearchLimitBoardCount(SearchCriteria cri) throws Exception {
		int count = limitBoardDAO.selectSearchLimitBoardCount(cri);
		return count;
	}

}
