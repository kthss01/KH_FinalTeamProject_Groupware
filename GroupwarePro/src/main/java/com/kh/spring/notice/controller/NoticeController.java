package com.kh.spring.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.notice.model.service.NoticeService;
import com.kh.spring.notice.model.vo.CompanyNotice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("noticeList.bo")
	public String selectList(@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,Model model) {       
		
		int listCount=noticeService.selectListCount();
		System.out.println("listCount:"+listCount);
		
		PageInfo pi=Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<CompanyNotice> list=noticeService.selectNoticeList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "/notice/noticeListView";
		
		
		
	}
	
	
//	@RequestMapping("noticeList.bo")
//	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
//		Model model, @RequestParam(value = "nno", required = false, defaultValue = "1") int nno) {
//
//		int listCount = noticeService.selectListCount(nno);
//
//		System.out.println("listCount : " + listCount);
//
//		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
//
//		//ArrayList<Board> list=boardService.selectList(pi);
//
//		ArrayList<CompanyNotice> list = noticeService.selectNoticeList(pi);
//
//		model.addAttribute("list", list);
//		model.addAttribute("pi", pi);
//
//		return "/notice/noticeListView";
//	}
	
	
	
	
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
	   return "notice/noticeEnrollForm";
	}
	
	@RequestMapping("enroll.bo")
	public String insertNotice(CompanyNotice notice,HttpServletRequest request,Model model) {


			//System.out.println(b);


			noticeService.insertNotice(notice);


			return "redirect:noticeList.bo";
	}
	
	
	
	
	
	
	
	
	
	
	
}
