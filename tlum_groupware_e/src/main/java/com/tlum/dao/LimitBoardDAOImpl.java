package com.tlum.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.Criteria;
import com.tlum.dto.LimitBoardVO;
import com.tlum.dto.SearchCriteria;

public class LimitBoardDAOImpl implements LimitBoardDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	private List<LimitBoardVO> limitBoardList = new ArrayList<LimitBoardVO>();

	private static final String NAMESPACE = "LimitBoardMapper";

	@Override
	public List<LimitBoardVO> selectLimitBoardList() throws Exception {
		try {
			limitBoardList = session.selectList(NAMESPACE + ".selectLimitBoardList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return limitBoardList;
	}

	@Override
	public LimitBoardVO selectLimitBoardById(String limit_board_bno) throws Exception {
		LimitBoardVO limitBoard = (LimitBoardVO) session.selectOne(NAMESPACE + ".selectLimitBoardById",
				limit_board_bno);
		return limitBoard;
	}

	@Override
	public void updateLimitBoard(LimitBoardVO limitBoard) throws Exception {
		session.update(NAMESPACE + ".updateLimitBoard", limitBoard);
	}

	@Override
	public void insertLimitBoard(LimitBoardVO limitBoard) throws Exception {
		session.update(NAMESPACE + ".insertLimitBoard", limitBoard);

	}

	@Override
	public void deleteLimitBoard(String limit_board_bno) throws Exception {
		session.update(NAMESPACE + ".deleteLimitBoard", limit_board_bno);
	}

	@Override
	public List<LimitBoardVO> selectLimitBoardListCriteria(Criteria cri) throws Exception {
		int page = cri.getPage();
		int perPageNum = cri.getPerPageNum();
		int offset = (page - 1) * perPageNum;
		int limit = perPageNum;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<LimitBoardVO> limitBoardList = session.selectList(NAMESPACE + ".selectLimitBoardList", null, rowBounds);
		return limitBoardList;
	}

	@Override
	public List<LimitBoardVO> selectSearchLimitBoardList(SearchCriteria cri) throws Exception {
		int offset = cri.getPageStart();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<LimitBoardVO> limitBoardList = session.selectList(NAMESPACE + ".selectSearchLimitBoardList", cri,
				rowBounds);
		return limitBoardList;
	}

	@Override
	public int selectSearchLimitBoardCount(SearchCriteria cri) throws Exception {
		int listCount = (Integer) session.selectOne(NAMESPACE + ".selectSearchLimitBoardCount", cri);
		return listCount;
	}
}
