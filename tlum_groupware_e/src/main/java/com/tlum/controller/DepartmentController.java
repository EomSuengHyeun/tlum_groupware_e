package com.tlum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tlum.dto.DepartmentVO;
import com.tlum.dto.PageMaker;
import com.tlum.dto.SearchCriteria;
import com.tlum.service.DepartmentService;

@Controller
@RequestMapping("/member/department")
public class DepartmentController {
	
	@Autowired
	private DepartmentService service;
	
	@RequestMapping(value="/depList")
	public void depList(@ModelAttribute("cri")SearchCriteria cri,Model model)throws Exception{
		List<DepartmentVO> depList=service.selectSearchDepartmentList(cri);
		model.addAttribute("depList",depList);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.selectDepartmentCount(cri));
		model.addAttribute(pageMaker);
	}
	@RequestMapping(value="depUpdate",method=RequestMethod.GET)
	public void updateGET(@ModelAttribute("cri")SearchCriteria cri,String dep_no,Model model)throws Exception{
		DepartmentVO department=service.selectDepartmentById(dep_no);
		model.addAttribute("department",department);
	}
	@RequestMapping(value="depUpdate",method=RequestMethod.POST)
	public String updatePOST(DepartmentVO department,SearchCriteria cri,RedirectAttributes rttr)throws Exception{
		service.updateDepartment(department);

		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		
		return "redirect:/member/department/depList";
	}
	@RequestMapping(value="/depDelete",method=RequestMethod.GET)
	public String delete(String dep_no,SearchCriteria cri,RedirectAttributes rttr)throws Exception{
		service.deleteDepartment(dep_no);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/member/department/depList";
		
	}
	@RequestMapping(value="/depInsert",method=RequestMethod.GET)
	public void insertGET()throws Exception{}
	
	@RequestMapping(value="depInsert",method=RequestMethod.POST)
	public String insertPOSt(DepartmentVO department,RedirectAttributes rttr)throws Exception{
		service.insertDepartment(department);
		
		return "redirect:/member/department/depList";
	}
	
	

}
