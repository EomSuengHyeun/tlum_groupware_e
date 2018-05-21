package com.tlum.service;

import java.util.List;

import com.tlum.dto.Criteria;
import com.tlum.dto.NoticeBoardVO;
import com.tlum.dto.SearchCriteria;

public interface NoticeBoardService {

	public List<NoticeBoardVO> selectNoticeBoardList() throws Exception;
	public NoticeBoardVO selectNoticeBoardById(String notice_board_bno) throws Exception;
	public void updateNoticeBoard(NoticeBoardVO noticeBoard) throws Exception;
	public void insertNoticeBoard(NoticeBoardVO noticeBoard) throws Exception;
	public void deleteNoticeBoard(String notice_board_bno) throws Exception;
	
	//페이징,서치
	public List<NoticeBoardVO> selectNoticeBoardListCriteria(Criteria cri) throws Exception;
	public List<NoticeBoardVO> selectSearchNoticeBoardList(SearchCriteria cri) throws Exception;
	int noticeBoardCount(SearchCriteria cri) throws Exception;
}
