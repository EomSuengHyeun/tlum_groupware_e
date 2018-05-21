package com.tlum.dao;

import java.util.List;

import com.tlum.dto.Criteria;
import com.tlum.dto.NoticeBoardVO;
import com.tlum.dto.SearchCriteria;

public interface NoticeBoardDAO {

	public List<NoticeBoardVO> selectNoticeBoardList() throws Exception;
	public NoticeBoardVO selectNoticeBoardById(String notice_board_bno) throws Exception;
	public void updateNoticeBoard(NoticeBoardVO noticeBoard) throws Exception;
	public void insertNoticeBoard(NoticeBoardVO noticeBoard) throws Exception;
	public void deleteNoticeBoard(String notice_board_bno) throws Exception;

	
	public List<NoticeBoardVO> selectNoticeBoardListCriteria(Criteria cri) throws Exception; //페이징
	public List<NoticeBoardVO> selectSearchNoticeBoardList(SearchCriteria cri) throws Exception;
	int selectSearchNoticeBoardCount(SearchCriteria cri) throws Exception; 
	
}
