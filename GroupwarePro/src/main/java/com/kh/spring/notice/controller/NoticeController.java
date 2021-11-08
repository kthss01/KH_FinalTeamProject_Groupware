package com.kh.spring.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.notice.model.service.NoticeService;
import com.kh.spring.notice.model.vo.CompanyNotice;
import com.kh.spring.notice.model.vo.NoReply;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("noticeList.bo")
	public String selectList(@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,Model model) {       
		
		int listCount=noticeService.selectListCount();
		System.out.println("listCount:"+listCount);
		
		PageInfo pi=Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<CompanyNotice> list=noticeService.selectNoticeList(pi);//
		
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
	public String insertNotice(CompanyNotice notice,HttpServletRequest request,Model model
								,@RequestParam(name="upfiles",required=false) MultipartFile file) {


			//System.out.println("notice:"+notice);
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName=saveFile(file,request);
			
			
			if(changeName !=null) {
				notice.setOriginName(file.getOriginalFilename());
				notice.setChangeName(changeName);
			}
		}


			noticeService.insertNotice(notice);
			
			


			return "redirect:/noticeList.bo";
	}
	
	
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		// TODO Auto-generated method stub
	
		String resources=request.getSession().getServletContext().getRealPath("resources");
		String savePath=resources+"\\upload_files\\";
		System.out.println("savePath:"+savePath);
		String originName=file.getOriginalFilename();
		String currentTime=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//확장자
		String ext=originName.substring(originName.lastIndexOf("."));
		
		String changeName=currentTime+ext;
		
		
		
		
		try {
			file.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			
			throw new CommException("file Upload error");
		}
		
		
		return changeName;
	}
	
	
	
	@RequestMapping("detail.bo")
	public ModelAndView selectNotice(int nno,ModelAndView mv) {
		
		CompanyNotice notice=noticeService.selectNotice(nno);
		
		mv.addObject("notice",notice).setViewName("/notice/noticeDetailView");
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="rinsert.bo")
	public String insertReply(NoReply r) {
		
		
		int result=noticeService.insertReply(r);
		return String.valueOf(result);
	
		
	}
	
	@RequestMapping("applyForm.bo")
	public String applyForm() {
		   return "notice/";
		   //TICKET_APPLN
		} 
	
	@ResponseBody
	@RequestMapping(value="notify.bo",produces="application/json; charset=utf-8")
	public String insertNotify(int nno) {
		
		//select
		CompanyNotice notice=noticeService.selectNotify(nno);
		
		
		int result=noticeService.insertNotify(notice);
		
		return String.valueOf(result);
		
		
	}
	
	
	
	
	
	
	
	
	

	
	
	
	
}
