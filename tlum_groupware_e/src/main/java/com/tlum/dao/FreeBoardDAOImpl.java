package com.tlum.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardVO;
import com.tlum.dto.SearchCriteria;

public class FreeBoardDAOImpl implements FreeBoardDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	private List<FreeBoardVO> freeBoardList=new ArrayList<FreeBoardVO>();
	
	private static final String NAMESPACE = "FreeBoardMapper";
	@Override
	public List<FreeBoardVO> selectFreeBoardList() throws Exception {
		freeBoardList = session.selectList(NAMESPACE+".selectFreeBoardList");
		return freeBoardList;
	}

	@Override
	public FreeBoardVO selectFreeBoardById(String free_board_bno) throws Exception {
		FreeBoardVO freeBoard =(FreeBoardVO)session.selectOne(NAMESPACE+".selectFreeBoardById",free_board_bno);
		return freeBoard;
	}

	@Override
	public void insertFreeBoard(FreeBoardVO freeBoard) throws Exception {
		session.update(NAMESPACE+".insertFreeBoard",freeBoard);
		

	}

	@Override
	public void updateFreeBoard(FreeBoardVO freeBoard) throws Exception {
		session.update(NAMESPACE+".updateFreeBoard",freeBoard);

	}

	@Override
	public void deleteFreeBoard(String free_board_bno) throws Exception {
		session.update(NAMESPACE+".deleteFreeBoard",free_board_bno);

	}

	@Override
	public List<FreeBoardVO> selectFreeBoardCriteria(Criteria cri) throws Exception {
		int page=cri.getPage();
		int perPageNum=cri.getPerPageNum();
		
		int offset=(page-1)*perPageNum;
		int limit=perPageNum;
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<FreeBoardVO> FreeBoardList=session.selectList(NAMESPACE+".selectFreeBoardList",null,rowBounds);
		return FreeBoardList;
	}

	@Override
	public List<FreeBoardVO> selectSearchFreeBoardList(SearchCriteria cri) throws Exception {
		int offset=cri.getPageStart();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<FreeBoardVO> boardList=session.selectList(NAMESPACE+".selectSearchFreeBoardList",cri,rowBounds);
		return boardList;
	}

	@Override
	public int selectSearchFreeBoardCount(SearchCriteria cri) throws Exception {
		int listCount=(Integer)session.selectOne(NAMESPACE+".selectSearchFreeBoardCount",cri);
		return listCount;
	}

	
}
