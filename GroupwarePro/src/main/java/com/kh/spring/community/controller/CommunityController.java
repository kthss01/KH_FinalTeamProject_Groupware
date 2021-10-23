package com.kh.spring.community.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.community.model.service.CommunityService;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.SelectBoardListInfo;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	@RequestMapping("boardList.co")
	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model, int cno) {

		System.out.println(model);
		System.out.println(cno);

		int listCount = communityService.selectListCount(cno);

		System.out.println("listCount : " + listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		SelectBoardListInfo info = new SelectBoardListInfo(cno, pi);

		ArrayList<CommunityBoard> list = communityService.selectBoardList(info);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "/community/communityBoardListView";
	}

	@GetMapping("enrollBoardForm.co")
	public String enrollBoardFrom() {
		return "/community/enrollBoardForm";
	}
	
	@GetMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		
		CommunityBoard b = communityService.selectBoard(bno);
		mv.addObject("b",b).setViewName("/community/communityBoardDetailView");
		return mv;
	}
}
