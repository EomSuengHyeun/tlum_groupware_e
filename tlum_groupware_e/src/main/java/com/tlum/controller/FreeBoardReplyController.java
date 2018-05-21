package com.tlum.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardReplyVO;
import com.tlum.dto.PageMaker;
import com.tlum.service.FreeBoardReplyService;


//url : /replies
///replies/all/{bno}		GET방식 : bno번 게시글의 댓글 목록
///replies/{rno}			PUT,PATCH방식 : rno 댓글의 수정 
///replies/{rno}			DELETE 방식 : rno 댓글의 삭제
///replies 				POST 방식 : 댓글 입력
///replies/{bno}/{page} 	GET방식 : bno번 게시글의 페이징 처리된 댓글 목록
@RestController
@RequestMapping("/freeBoardReplies")
public class FreeBoardReplyController {
	
	@Autowired
	private FreeBoardReplyService service;
	
	@RequestMapping(value="/all/{free_board_bno}",method=RequestMethod.GET)
	public ResponseEntity<List<FreeBoardReplyVO>> list(@PathVariable("free_Board_bno")int free_Board_bno)throws Exception{
		System.out.println("free_Board_bno"+free_Board_bno);
		return null;
	}
	@RequestMapping(value="/{reply_no}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reply_no")String reply_no)throws Exception{
		ResponseEntity<String> entity=null;
		System.out.println("delete rno :" +reply_no);
		try{
		service.deleteFreeBoardReply(reply_no);
		entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(SQLException e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody FreeBoardReplyVO freeBoardReply){
		ResponseEntity<String> entity=null;
		System.out.println("freeBoardReply:"+freeBoardReply);
		try {
			service.insertFreeBoardReply(freeBoardReply);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);;
		}
		return entity;
	}
	
	@RequestMapping(value="/{free_board_bno}/{page}",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(@PathVariable("free_board_bno")String free_board_bno,@PathVariable("page")int page)throws Exception{
		ResponseEntity<Map<String,Object>> entity=null;
		Criteria cri=new Criteria();
		cri.setPage(page);
		cri.setPerPageNum(5);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countReply(free_board_bno));
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pageMaker", pageMaker);
		try{
			List<FreeBoardReplyVO>replyList=service.FreeBoardReplyListPage(free_board_bno, cri);
			map.put("list",replyList);
		entity=new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(SQLException e){
			e.printStackTrace();
			entity=new ResponseEntity<Map<String,Object>>
								(HttpStatus.INTERNAL_SERVER_ERROR);			
		}		
		
		System.out.println(entity);
		return entity;
	}
	

}
