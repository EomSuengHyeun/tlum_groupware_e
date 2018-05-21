package com.tlum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tlum.dto.EmployeeVO;
import com.tlum.service.EmployeeServiceImpl;

@Controller
@RequestMapping("/")
public class LoginController {
	
	@Autowired
	private EmployeeServiceImpl empService;
   

   @RequestMapping(value="/",method=RequestMethod.GET)
   public String goLoginPage(Model model)throws Exception{
      return "redirect:/index";
   }
   
   @RequestMapping(value="/index",method=RequestMethod.GET)
   public void loginPage(Model model)throws Exception{
   }
   
   @RequestMapping(value="/index",method=RequestMethod.POST)
   public String empLogin(EmployeeVO employee,Model model)throws Exception{
	   boolean chk=empService.empLoginChk(employee);
	   String url="";
	   
	   if(chk==true){
		   url="redirect:/member/main/main";
	   }else{
		   model.addAttribute("msg","False");
		   url="/index";
	   }
	   return url;
	   
   }
   
}