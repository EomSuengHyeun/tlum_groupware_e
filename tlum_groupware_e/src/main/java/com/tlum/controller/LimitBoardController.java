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
import com.tlum.dto.LimitBoardVO;
import com.tlum.dto.PageMaker;
import com.tlum.dto.SearchCriteria;
import com.tlum.service.LimitBoardService;

@Controller
@RequestMapping("/member/limitBoard")

public class LimitBoardController {

	@Autowired(required = false)
	private LimitBoardService service;

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void limitBoardList(Model model) throws Exception {
		List<LimitBoardVO> limitBoardList = service.selectLimitBoardList();
		model.addAttribute("listAll", limitBoardList);
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detailGET(String limit_board_bno, Model model) throws Exception {
		LimitBoardVO limitBoard = service.selectLimitBoardById(limit_board_bno);
		model.addAttribute("limitBoard", limitBoard);
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertGET() throws Exception {
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(LimitBoardVO limitBoard, RedirectAttributes rtts) throws Exception {
		service.insertLimitBoard(limitBoard);
		return "redirect:/member/limitBoard/listLimitSBoardPage";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(String limit_board_bno, Model model) throws Exception {
		LimitBoardVO limitBoard = service.selectLimitBoardById(limit_board_bno);
		model.addAttribute("limitBoard", limitBoard);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(LimitBoardVO limitBoard, RedirectAttributes rttr) throws Exception {
		service.updateLimitBoard(limitBoard);
		return "redirect:/member/limitBoard/listLimitSBoardPage";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(LimitBoardVO limitBoard, RedirectAttributes rttr) throws Exception {
		System.out.println("delete");
		System.out.println(limitBoard.getLimit_board_bno());
		service.deleteLimitBoard(limitBoard.getLimit_board_bno());
		return "redirect:/member/limitBoard/listLimitSBoardPage";
	}

	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void limitBoardListCri(Criteria cri, Model model) throws Exception {
		List<LimitBoardVO> limitBoardList = service.selectLimitBoardListCriteria(cri);
		model.addAttribute("limitBoardList", limitBoardList);
	}

	@RequestMapping(value = "/listLimitBoardPage", method = RequestMethod.GET)
	public void limitBoardListPage(Criteria cri, Model model) throws Exception {
		List<LimitBoardVO> limitBoardList = service.selectLimitBoardListCriteria(cri);
		model.addAttribute("limitBoardList", limitBoardList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalCount = service.selectLimitBoardList().size();
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/listLimitSBoardPage", method = RequestMethod.GET)
	public void searchLimitBoard(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		List<LimitBoardVO> limitBoardList = service.selectSearchLimitBoardList(cri);
		model.addAttribute("searchLimitBoard", limitBoardList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.selectSearchLimitBoardCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}

}
