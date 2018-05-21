package com.tlum.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tlum.dto.DepartmentVO;
import com.tlum.dto.EmployeeVO;
import com.tlum.dto.MsgSendVO;
import com.tlum.dto.PageMaker;
import com.tlum.dto.SearchCriteria;
import com.tlum.service.DepartmentService;
import com.tlum.service.EmployeeService;
import com.tlum.service.MsgReceiveService;
import com.tlum.service.MsgSendService;

@Controller
@RequestMapping("/member/send")
public class MSGSendController {
	
	@Autowired
	private MsgSendService sendService;
	
	@Autowired
	private DepartmentService depService;
	
	@Autowired
	private MsgReceiveService receiveService;
	@Autowired
	private EmployeeService empService;
	
	/* send */
	
	@RequestMapping(value="/sendList")
	public void sendList(@ModelAttribute("cri")SearchCriteria cri,Model model,HttpSession session)throws Exception{
		EmployeeVO emp=(EmployeeVO)session.getAttribute("loginUser");
		String emp_id=emp.getEmp_id();
		List<MsgSendVO> sendList=sendService.selectMsgSendList(cri,emp_id);
		
		model.addAttribute("sendList",sendList);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(sendService.MsgSendCount(cri,emp_id));
		model.addAttribute(pageMaker);
	}
	@RequestMapping(value="/senddetail",method=RequestMethod.GET)
	public void sendDetail(@ModelAttribute("cri")SearchCriteria cri,String msg_no,Model model)throws Exception{
		MsgSendVO msgSend=sendService.selectMsgSendById(msg_no);
		model.addAttribute("msgSend",msgSend);
	}
	@RequestMapping(value="/senddelete",method=RequestMethod.GET)
	public String sendDelete(String msg_no,SearchCriteria cri,RedirectAttributes rttr)throws Exception{
		System.out.println("msg_no:"+msg_no);
		sendService.deleteMsgSend(msg_no);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/member/send/sendList";
	}
	@RequestMapping(value="/sendListdelete",method=RequestMethod.GET)
	public String sendListDelete(String msg_noList,SearchCriteria cri,RedirectAttributes rttr)throws Exception{

		System.out.println("msg_noList:"+msg_noList);
		sendService.deleteMsgSendList(msg_noList);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/member/send/sendList";
	}
	
	@RequestMapping(value="/sendInsert",method=RequestMethod.GET)
	public void sendInsertGET(Model model)throws Exception{
		List<DepartmentVO> depList=depService.selectDepartmentList();
		model.addAttribute("depList",depList);

	}
	
	@RequestMapping(value="/sendInsert",method=RequestMethod.POST)
	public String sendInsertPOST(MsgSendVO msgSend,RedirectAttributes rttr)throws Exception{
//		System.out.println("sss");
//		System.out.println(msgSend);
		sendService.insertMsgSend(msgSend);
		receiveService.insertMsgReceive(msgSend);
		return "redirect:/member/send/sendList";
		
	}
	

}
