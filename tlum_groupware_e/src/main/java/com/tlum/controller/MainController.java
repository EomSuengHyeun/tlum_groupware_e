package com.tlum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/main")
public class MainController {
   

   @RequestMapping(value="/main",method=RequestMethod.GET)
   public void main(Model model)throws Exception{
      
   }
  
   
}