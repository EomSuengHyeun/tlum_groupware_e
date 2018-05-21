package com.tlum.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.Criteria;
import com.tlum.dto.NoticeBoardVO;
import com.tlum.dto.SearchCriteria;

public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	private List<NoticeBoardVO> noticeBoardList = new ArrayList<NoticeBoardVO>();

	private static final String NAMESPACE = "NoticeBoardMapper";

	@Override
	public List<NoticeBoardVO> selectNoticeBoardList() throws Exception {
		try {
			noticeBoardList = session.selectList(NAMESPACE + ".selectNoticeBoardList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeBoardList;
	}

	@Override
	public NoticeBoardVO selectNoticeBoardById(String notice_board_bno) throws Exception {
		NoticeBoardVO noticeBoard = (NoticeBoardVO) session.selectOne(NAMESPACE + ".selectNoticeBoardById",
				notice_board_bno);
		return noticeBoard;
	}

	@Override
	public void updateNoticeBoard(NoticeBoardVO noticeBoard) throws Exception {
		session.update(NAMESPACE + ".updateNoticeBoard", noticeBoard);

	}

	@Override
	public void insertNoticeBoard(NoticeBoardVO noticeBoard) throws Exception {
		try {
			session.update(NAMESPACE + ".insertNoticeBoard", noticeBoard);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteNoticeBoard(String notice_board_bno) throws Exception {
		session.update(NAMESPACE + ".deleteNoticeBoard", notice_board_bno);

	}

	@Override
	public List<NoticeBoardVO> selectNoticeBoardListCriteria(Criteria cri) throws Exception {
		int page = cri.getPage();
		int perPageNum = cri.getPerPageNum();
		int offset = (page - 1) * perPageNum;
		int limit = perPageNum;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeBoardVO> noticeBoardList = session.selectList(NAMESPACE + ".selectNoticeBoardList", null, rowBounds);
		return noticeBoardList;
	}

	@Override
	public List<NoticeBoardVO> selectSearchNoticeBoardList(SearchCriteria cri) throws Exception {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<NoticeBoardVO> noticeBoardList = session.selectList(NAMESPACE + ".selectSearchNoticeBoardList", cri,
				rowBounds);
		return noticeBoardList;
	}

	@Override
	public int selectSearchNoticeBoardCount(SearchCriteria cri) throws Exception {
		int listCount = (Integer) session.selectOne(NAMESPACE + ".selectSearchNoticeBoardCount", cri);
		return listCount;
	}

}
