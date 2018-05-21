package com.tlum.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlum.dto.CalLoadDTO;
import com.tlum.dto.CalenderVO;
import com.tlum.dto.EmployeeVO;
import com.tlum.dto.RabelVO;
import com.tlum.service.CalLoadService;
import com.tlum.service.CalenderService;
import com.tlum.service.RabelService;

@Controller
@RequestMapping("/member/cal")
public class CalenderController {
	@Autowired
	private CalenderService calService;
	@Autowired
	private RabelService raService;
	@Autowired
	private CalLoadService calLoadService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void calMain(Model model,HttpSession session) {
		EmployeeVO empl= (EmployeeVO) session.getAttribute("loginUser");
		List<RabelVO> rabelList = null;
		try {
			rabelList = raService.selectRabel(empl.getEmp_id());
			model.addAttribute("rabelList", rabelList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/main", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<CalLoadDTO> calMainAjax(Model model,HttpSession session) {
		EmployeeVO empl= (EmployeeVO) session.getAttribute("loginUser");
		List<RabelVO> rabelList = null;
		List<CalLoadDTO> calLoadList = null;
		try {
			calLoadList = calLoadService.selectListByID(empl.getEmp_id());
			rabelList = raService.selectRabel(empl.getEmp_id());
			model.addAttribute("rabelList", rabelList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return calLoadList;
	}
//	@RequestMapping(value = "/rabelMain", method = RequestMethod.POST)
//	public List<RabelVO> rabelMainAjax(Model model,HttpSession session) {
//		EmployeeVO empl= (EmployeeVO) session.getAttribute("loginUser");
//		List<RabelVO> rabelList = null;
//		try {
//			rabelList = raService.selectRabel(empl.getEmp_id());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return rabelList;
//	}


	@RequestMapping(value = "/insertCal", method = RequestMethod.POST)
	public ResponseEntity<String> insertCal(@RequestBody CalenderVO calender) {

		ResponseEntity<String> entity = null;
		try {
			calService.insertCalender(calender);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAILE", HttpStatus.INTERNAL_SERVER_ERROR);
			return entity;
		}
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/insertRabel", method = RequestMethod.POST)
	public ResponseEntity<String> insertRabel(@RequestBody RabelVO rabel) {
		ResponseEntity<String> entity = null;
		try {
			raService.insertRabel(rabel);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAILE", HttpStatus.INTERNAL_SERVER_ERROR);
			return entity;
		}
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/deleteCal", method = RequestMethod.POST)
	public ResponseEntity<String> deleteCal(@RequestBody String cal_no) {
		ResponseEntity<String> entity = null;
		System.out.println(cal_no);
		try {
			calService.deleteCal(cal_no);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAILE", HttpStatus.INTERNAL_SERVER_ERROR);
			return entity;
		}
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/modifyCal", method = RequestMethod.POST)
	public ResponseEntity<String> modifyCal(@RequestBody CalenderVO calender) {
		ResponseEntity<String> entity = null;
		try {
			calService.modifyCal(calender);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAILE", HttpStatus.INTERNAL_SERVER_ERROR);
			return entity;
		}
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
	}

}
