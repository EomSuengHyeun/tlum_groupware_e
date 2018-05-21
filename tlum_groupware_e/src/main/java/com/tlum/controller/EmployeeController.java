package com.tlum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tlum.dto.EmployeeVO;
import com.tlum.dto.SearchCriteria;
import com.tlum.service.EmployeeService;

@Controller
@RequestMapping("/member/emp")
public class EmployeeController {
	
	@Autowired(required=false)
	private EmployeeService service;
	
	@RequestMapping(value="/listEmp",method=RequestMethod.GET)
	public void employeeList(Model model)throws Exception{
		List<EmployeeVO> employeeList=service.selectEmployeeList();
		model.addAttribute("employeeList",employeeList);
	}
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public void insertGET()throws Exception{
		
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertPOST(EmployeeVO employee,RedirectAttributes rtts)throws Exception{
		service.insertEmployee(employee);
		service.insertEmployeePic(employee);
		return "redirect:/member/emp/listEmp";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public void updateGET(EmployeeVO employee,Model model)throws Exception{
		service.updateEmployee(employee);
		model.addAttribute(service);
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updatePOST(EmployeeVO employee,RedirectAttributes rttr)throws Exception{
		service.updateEmployee(employee);
		return "redirect:/member/emp/listEmp";
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(String emp_id,RedirectAttributes rttr)throws Exception{
		service.deleteEmployee(emp_id);
		return "redirect:/member/emp/listEmp";
	}

	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public void detailGET(String emp_id,Model model)throws Exception{
		EmployeeVO employee=service.selectEmployeeById(emp_id);
		model.addAttribute("employee",employee);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyGET(EmployeeVO employee,RedirectAttributes rttr)throws Exception{
		service.updateEmployee(employee);
		return "redirect:/member/emp/listEmp";
	}
	@RequestMapping(value="depListEmp",method=RequestMethod.POST)
	@ResponseBody
	public List<EmployeeVO> depEmployeeList(String dep_no,Model model)throws Exception{
		List<EmployeeVO> depListEmp=service.selectEmployeeListByDepNo(dep_no);
		
		return depListEmp;
	}
	@RequestMapping(value="msgEmpSearch",method=RequestMethod.POST)
	@ResponseBody
	public List<EmployeeVO> msgEmpSearchList(Model model,SearchCriteria cri)throws Exception{
		System.out.println(cri);
		List<EmployeeVO> empSearchList=service.selectSearchEmploy(cri);
		
		return empSearchList;
		
	}

}
