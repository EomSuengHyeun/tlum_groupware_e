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
import com.tlum.dto.NoticeBoardVO;
import com.tlum.dto.PageMaker;
import com.tlum.dto.SearchCriteria;
import com.tlum.service.NoticeBoardService;

@Controller
@RequestMapping("/member/notice")
public class NoticeBoardController {

	@Autowired(required = false)
	private NoticeBoardService service;

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void noticeBoardList(Model model) throws Exception {
		List<NoticeBoardVO> noticeBoardList = service.selectNoticeBoardList();
		model.addAttribute("listAll", noticeBoardList);
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detailGet(String notice_board_bno, Model model) throws Exception {
		NoticeBoardVO noticeBoard = service.selectNoticeBoardById(notice_board_bno);
		model.addAttribute("noticeBoard", noticeBoard);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGet(String notice_board_bno, Model model) throws Exception {
		NoticeBoardVO noticeBoard = service.selectNoticeBoardById(notice_board_bno);
		model.addAttribute("noticeBoard", noticeBoard);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(NoticeBoardVO noticeBoard, RedirectAttributes rttr) throws Exception {
		service.updateNoticeBoard(noticeBoard);
		return "redirect:/member/notice/listNoticeSBoardPage";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertGET() throws Exception {
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(NoticeBoardVO noticeBoard, RedirectAttributes rtts) throws Exception {
		service.insertNoticeBoard(noticeBoard);
		return "redirect:/member/notice/listNoticeSBoardPage";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(NoticeBoardVO noticeBoard, RedirectAttributes rttr) throws Exception {
		System.out.println("delete");
		System.out.println(noticeBoard.getNotice_board_bno());
		service.deleteNoticeBoard(noticeBoard.getNotice_board_bno());
		return "redirect:/member/notice/listNoticeSBoardPage";
	}

	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void noticeBoardlistCri(Criteria cri, Model model) throws Exception {
		List<NoticeBoardVO> noticeBoardList = service.selectNoticeBoardListCriteria(cri);
		model.addAttribute("noticeBoardList", noticeBoardList);
	}

	@RequestMapping(value = "/listNoticeBoardPage", method = RequestMethod.GET)
	public void noticeBoardListPage(Criteria cri, Model model) throws Exception {
		List<NoticeBoardVO> noticeBoardList = service.selectNoticeBoardListCriteria(cri);
		model.addAttribute("noticeBoardList", noticeBoardList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalCount = service.selectNoticeBoardList().size();
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
	}

	// 검색
	@RequestMapping(value = "/listNoticeSBoardPage", method = RequestMethod.GET)
	public void searchNoticeBoard(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		List<NoticeBoardVO> noticeBoardList = service.selectSearchNoticeBoardList(cri);
		model.addAttribute("searchNoticeBoard", noticeBoardList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.noticeBoardCount(cri));
		model.addAttribute(pageMaker);
	}

}
