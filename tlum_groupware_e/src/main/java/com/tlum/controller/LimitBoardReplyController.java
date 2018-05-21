package com.tlum.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tlum.dto.Criteria;
import com.tlum.dto.LimitBoardReplyVO;
import com.tlum.dto.PageMaker;
import com.tlum.service.LimitBoardReplyService;

// url : /replies
// /replies/all/{bno}		GET방식 : bno번 게시글의 댓글 목록
// /replies/{rno}			PUT,PATCH방식 : rno 댓글의 수정 
// /replies/{rno}			DELETE 방식 : rno 댓글의 삭제
// /replies 				POST 방식 : 댓글 입력
// /replies/{bno}/{page} 	GET방식 : bno번 게시글의 페이징 처리된 댓글 목록

@Controller
@RequestMapping("/limitBoardReplies")
public class LimitBoardReplyController {

	@Autowired(required = false)
	private LimitBoardReplyService service;

	@RequestMapping(value = "/all/{limit_board_bno}", method = RequestMethod.GET)
	public ResponseEntity<List<LimitBoardReplyVO>> list(@PathVariable("limit_board_bno") int limit_board_bno)
			throws Exception {
		System.out.println("limit_board_bno" + limit_board_bno);
		return null;
	}

	@RequestMapping(value = "/{reply_no}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reply_no") String reply_no) throws Exception {
		ResponseEntity<String> entity = null;
		System.out.println("delete reply_no" + reply_no);
		try {
			service.deleteLimitBoardReply(reply_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody LimitBoardReplyVO limitBoardReply) {
		ResponseEntity<String> entity = null;
		try {
			service.insertLimitBoardReply(limitBoardReply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	@RequestMapping(value = "/{limit_board_bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("limit_board_bno") String limit_board_bno,
			@PathVariable("page") int page) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		Criteria cri = new Criteria();
		cri.setPage(page);
		cri.setPerPageNum(5);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countReply(limit_board_bno));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageMaker", pageMaker);
		try {
			List<LimitBoardReplyVO> replyList = service.selectLimitBoardReplyListPage(limit_board_bno, cri);
			map.put("list", replyList);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	
}
