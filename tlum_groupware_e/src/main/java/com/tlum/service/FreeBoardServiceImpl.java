package com.tlum.service;

import java.util.List;

import com.tlum.dao.FreeBoardDAO;
import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardVO;
import com.tlum.dto.SearchCriteria;

public class FreeBoardServiceImpl implements FreeBoardService {
	
	private FreeBoardDAO freeBoardDAO;
	
	public void setFreeBoardDAO(FreeBoardDAO freeBoardDAO){
		this.freeBoardDAO=freeBoardDAO;
	}
	

	public FreeBoardDAO getFreeBoardDAO() {
		return freeBoardDAO;
	}


	@Override
	public List<FreeBoardVO> selectFreeBoardList() throws Exception {
		List<FreeBoardVO> freeBoard=freeBoardDAO.selectFreeBoardList();
		return freeBoard;
	}

	@Override
	public FreeBoardVO selectFreeBoardById(String free_board_bno) throws Exception {
		FreeBoardVO freeBoard = freeBoardDAO.selectFreeBoardById(free_board_bno);
		
		return freeBoard;
	}

	@Override
	public void insertFreeBoard(FreeBoardVO freeBoard) throws Exception {
		freeBoardDAO.insertFreeBoard(freeBoard);
		freeBoard.setEmp_id(freeBoard.getEmp_id());

	}

	@Override
	public void updateFreeBoard(FreeBoardVO freeBoard) throws Exception {
		freeBoardDAO.updateFreeBoard(freeBoard);

	}

	@Override
	public void deleteFreeBoard(String free_board_bno) throws Exception {
		freeBoardDAO.deleteFreeBoard(free_board_bno);

	}


	@Override
	public List<FreeBoardVO> selectFreeBoardListCriteria(Criteria cri) throws Exception {
		List<FreeBoardVO> freeBoardList=freeBoardDAO.selectFreeBoardCriteria(cri);
		return freeBoardList;
	}


	@Override
	public List<FreeBoardVO> selectSearchFreeBoardList(SearchCriteria cri) throws Exception {
		List<FreeBoardVO> freeBoard=freeBoardDAO.selectSearchFreeBoardList(cri);
		return freeBoard;
	}


	@Override
	public int freeBoardCount(SearchCriteria cri) throws Exception {
		int count=freeBoardDAO.selectSearchFreeBoardCount(cri);
		return count;
	}

}
