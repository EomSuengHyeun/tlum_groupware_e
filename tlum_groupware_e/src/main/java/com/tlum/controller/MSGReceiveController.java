package com.tlum.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tlum.dto.EmployeeVO;
import com.tlum.dto.MsgReceiveVO;
import com.tlum.dto.PageMaker;
import com.tlum.dto.SearchCriteria;
import com.tlum.service.MsgReceiveService;

@Controller
@RequestMapping("/member/receive")
public class MSGReceiveController {
	
	@Autowired
	private MsgReceiveService receiveService;
	
	
    @RequestMapping(value="/receiveList")
	public void receiveList(@ModelAttribute("cri")SearchCriteria cri,Model model,HttpSession session)throws Exception{
    	EmployeeVO emp=(EmployeeVO)session.getAttribute("loginUser");
		String emp_id=emp.getEmp_id();
		List<MsgReceiveVO> msgReceiveList=receiveService.selectMsgReceiveList(cri,emp_id);
		model.addAttribute("receiveList",msgReceiveList);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(receiveService.MsgReceiveCount(cri,emp_id));
		model.addAttribute(pageMaker);
	}
	@RequestMapping(value="/receiveDetail",method=RequestMethod.GET)
	public void receiveDetail(@ModelAttribute("cri")SearchCriteria cri,String msg_no,Model model)throws Exception{
		MsgReceiveVO msgReceive=receiveService.selectMsgReceiveById(msg_no);
		model.addAttribute("msgReceive",msgReceive);
	}
	@RequestMapping(value="/receiveDelete",method=RequestMethod.POST)
	public String receiveDelete(String msg_no,SearchCriteria cri,RedirectAttributes rttr)throws Exception{
		receiveService.deleteMsgReceive(msg_no);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/member/msg/msgList";
	}
	

}
