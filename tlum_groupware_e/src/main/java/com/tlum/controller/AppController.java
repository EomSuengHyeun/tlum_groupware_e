package com.tlum.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tlum.dto.AppVO;
import com.tlum.dto.SearchCriteria;
import com.tlum.service.AppService;

@Controller
@RequestMapping("/member/app")
public class AppController {
	

	@Autowired(required=false)
	private AppService appService;

	@RequestMapping(value="/listAppPage",method=RequestMethod.GET)
	public void appList(@ModelAttribute("cri")SearchCriteria cri,Model model)throws Exception{
		
		List<AppVO> appList=new ArrayList<AppVO>();
		appList=appService.selectAppList();
		model.addAttribute("appList",appList);
		
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public void detailApp(String app_no,
						@ModelAttribute("cri")SearchCriteria cri,
						Model model)throws Exception{
		AppVO app=new AppVO();
		app=appService.selectAppById(app_no);
		model.addAttribute("app",app);
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public void insertAppPage(@ModelAttribute("cri")SearchCriteria cri,
							Model model)throws Exception{
		
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertApp(AppVO app,
						@ModelAttribute("cri")SearchCriteria cri,
						Model model)throws Exception{
		appService.insertApp(app);
		
		return "redrict:/listAppPage";
	}
	
}
