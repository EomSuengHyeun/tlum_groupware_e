package com.tlum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tlum.dto.FreeBoardVO;
import com.tlum.dto.PageMaker;
import com.tlum.dto.SearchCriteria;
import com.tlum.service.FreeBoardService;

@Controller
@RequestMapping("/member/sfreeboard")
public class SearchFreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	@RequestMapping(value="/freeBoardList")
	public void listPage(@ModelAttribute("cri")SearchCriteria cri,Model model)throws Exception{
		List<FreeBoardVO> freeBoardList=service.selectSearchFreeBoardList(cri);
		model.addAttribute("list",freeBoardList);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.freeBoardCount(cri));
		model.addAttribute(pageMaker);
	}
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public void detail(@ModelAttribute("cri")SearchCriteria cri,String free_board_bno,Model model)throws Exception{
		FreeBoardVO freeBoard=service.selectFreeBoardById(free_board_bno);
		model.addAttribute(freeBoard);
	}
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public void updatePage(@ModelAttribute("cri")SearchCriteria cri,String free_board_bno,Model model)throws Exception{
		FreeBoardVO freeBoard=service.selectFreeBoardById(free_board_bno);
		model.addAttribute(freeBoard);
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updatePagePOST(FreeBoardVO freeBoard,SearchCriteria cri,RedirectAttributes rttr)throws Exception{
		System.out.println("freeBoard"+freeBoard);
		service.updateFreeBoard(freeBoard);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/member/sfreeboard/freeBoardList";
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deletePage(String free_board_bno,SearchCriteria cri,RedirectAttributes rttr)throws Exception{
		service.deleteFreeBoard(free_board_bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/member/sfreeboard/freeBoardList";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public void insertGET()throws Exception{}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertPOST(FreeBoardVO freeBoard,RedirectAttributes rttr)throws Exception{
		service.insertFreeBoard(freeBoard);
		
		return "redirect:/member/sfreeboard/freeBoardList";
	}
	

}
