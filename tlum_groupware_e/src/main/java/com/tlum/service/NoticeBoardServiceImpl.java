package com.tlum.service;

import java.util.List;

import com.tlum.dao.NoticeBoardDAO;
import com.tlum.dto.Criteria;
import com.tlum.dto.NoticeBoardVO;
import com.tlum.dto.SearchCriteria;

public class NoticeBoardServiceImpl implements NoticeBoardService {

	private NoticeBoardDAO noticeBoardDAO;

	public void setNoticeBoardDAO(NoticeBoardDAO noticeBoardDAO) {
		this.noticeBoardDAO = noticeBoardDAO;
	}

	public NoticeBoardDAO getNoticeBoardDAO() {
		return noticeBoardDAO;
	}

	@Override
	public List<NoticeBoardVO> selectNoticeBoardList() throws Exception {
		List<NoticeBoardVO> noticeBoard = noticeBoardDAO.selectNoticeBoardList();
		return noticeBoard;

	}

	@Override
	public NoticeBoardVO selectNoticeBoardById(String notice_board_bno) throws Exception {
		NoticeBoardVO noticeBoard = noticeBoardDAO.selectNoticeBoardById(notice_board_bno);
		return noticeBoard;
	}

	@Override
	public void updateNoticeBoard(NoticeBoardVO noticeBoard) throws Exception {
		noticeBoardDAO.updateNoticeBoard(noticeBoard);
	}

	@Override
	public void insertNoticeBoard(NoticeBoardVO noticeBoard) throws Exception {
		noticeBoardDAO.insertNoticeBoard(noticeBoard);
	}

	@Override
	public void deleteNoticeBoard(String notice_board_bno) throws Exception {
		noticeBoardDAO.deleteNoticeBoard(notice_board_bno);

	}

	@Override
	public List<NoticeBoardVO> selectNoticeBoardListCriteria(Criteria cri) throws Exception {
		List<NoticeBoardVO> noticeBoard = noticeBoardDAO.selectNoticeBoardListCriteria(cri);
		return noticeBoard;
	}

	@Override
	public List<NoticeBoardVO> selectSearchNoticeBoardList(SearchCriteria cri) throws Exception {
		List<NoticeBoardVO> noticeBoardSearch = noticeBoardDAO.selectSearchNoticeBoardList(cri);
		return noticeBoardSearch;
	}

	@Override
	public int noticeBoardCount(SearchCriteria cri) throws Exception {
		int count = noticeBoardDAO.selectSearchNoticeBoardCount(cri);
		return count;
	}

}
