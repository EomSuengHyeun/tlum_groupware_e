package com.tlum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tlum.dto.Criteria;
import com.tlum.dto.FreeBoardVO;
import com.tlum.dto.PageMaker;
import com.tlum.service.FreeBoardService;

@Controller
@RequestMapping("/member/freeboard")
public class FreeBoardController {
	
	@Autowired(required=false)
	private FreeBoardService service;
	
	@RequestMapping(value="/listFreeBoard",method=RequestMethod.GET)
	public void FreeBoardList(Model model)throws Exception{
		
		List<FreeBoardVO> freeBoardList=service.selectFreeBoardList();
		model.addAttribute("freeBoardList",freeBoardList);
		
		
	}
	@RequestMapping(value="/listCri",method=RequestMethod.GET)
	public void listCri(Criteria cri,Model model)throws Exception{
		List<FreeBoardVO> freeBoardList=service.selectFreeBoardListCriteria(cri);
		model.addAttribute("freeBoardList",freeBoardList);
	}
	@RequestMapping(value="/listFreeBoardPage",method=RequestMethod.GET)
	public void FreeBoardListPage(Criteria cri,Model model)throws Exception{
		
		List<FreeBoardVO> freeBoardList=service.selectFreeBoardListCriteria(cri);
		model.addAttribute("freeBoardList",freeBoardList);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		int totalCount=service.selectFreeBoardList().size();
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker",pageMaker);
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public void detailGET(String free_board_bno,Model model)throws Exception{
		FreeBoardVO freeBoard=service.selectFreeBoardById(free_board_bno);
		
		model.addAttribute("freeBoard",freeBoard);
	}
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public void updateGET(FreeBoardVO freeBoard,Model model)throws Exception{
		service.updateFreeBoard(freeBoard);
		model.addAttribute(service);
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updatePOST(FreeBoardVO freeBoard,RedirectAttributes rttr)throws Exception{
		service.updateFreeBoard(freeBoard);
		return "redirect:/member/board/listFreeBoard";
	}
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public void insertGET()throws Exception{
		
	}
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertPOST(FreeBoardVO freeBoard,RedirectAttributes rtts)throws Exception{
		service.insertFreeBoard(freeBoard);
		return "redirect:/member/board/listFreeBoard";
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(String free_board_bno, RedirectAttributes rttr)throws Exception{
		service.deleteFreeBoard(free_board_bno);
		return "redirect:/member/board/listFreeBoard";
	}

}
