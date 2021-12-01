package com.kh.spring.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName=saveFile(file,request);
			
			
			if(changeName !=null) {
				notice.setOriginName(file.getOriginalFilename());
				notice.setChangeName(changeName);
			}
		}
		
		//notice.setAnonym(anonym);
	



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
		   
		} 
	
	@ResponseBody
	@RequestMapping(value="rlist.bo",produces="application/json; charset=utf-8")
	public String selectReplyList(int nno) {
		ArrayList<NoReply> list=noticeService.selectReplyList(nno);
		
		
		return new GsonBuilder().create().toJson(list);
		
		
	}
	
	
	
	
	
//	@ResponseBody
//	@RequestMapping(value="notify.bo",produces="application/json; charset=utf-8")
//	public String insertNotify(int nno) {
//		
//		
//		CompanyNotice notice=noticeService.selectNotify(nno);
//		
//		
//		int result=noticeService.insertNotify(notice);
//		
//		return String.valueOf(result);
//		
//		
//	}
	
	
	@ResponseBody
	@RequestMapping(value="insertNotify.bo",produces="application/json; charset=utf-8")
	public String selectBoard(int nno) {
		//CompanyNotice notice=noticeService.selectNotice(nno);
		
		//mv.addObject("b",b).setViewName("board/boardDetailView");//key value 형식 
		
		
		int result=noticeService.updateNotice(nno);
		
		
		
		
		//return mv;
		
		//return String.valueOf(result);
		return "redirect:/noticeList.bo";
		
		//return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	
	@RequestMapping("updateForm.bo")
	public ModelAndView updateForm(int nno,ModelAndView mv) {
		mv.addObject("notice",noticeService.selectNotice(nno))
			.setViewName("notice/noticeUpdateForm");
		
		return mv;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		// TODO Auto-generated method stu
		String resources=request.getSession().getServletContext().getRealPath("resources");
		String savePath=resources+"\\upload_files\\";
		System.out.println("savePath:"+savePath);
		File deleteFile=new File(savePath+fileName);
		deleteFile.delete();
		
	}
	
	
	@RequestMapping("update.bo")
	public String updateBNotice(CompanyNotice notice,HttpServletRequest request,
										@RequestParam(name="upfiles",required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			if(notice.getChangeName() !=null) {
				deleteFile(notice.getChangeName(),request);
			}
			String changeName=saveFile(file,request);
			
			notice.setOriginName(file.getOriginalFilename());
			notice.setChangeName(changeName);
		}
		
		
		
		
		
		noticeService.updateBNotice(notice);
		
		
		//return mv;
		return "redirect:/noticeList.bo";
	}
	
	
	
	@RequestMapping("increaseSupport.bo")
	public String increaseSupport(int nno,RedirectAttributes redirect,HttpServletRequest request) {
	
		noticeService.increaseSupport(nno);
		
		//mv.addObject("nno",nno).setViewName("redirect:detail.bo");
		
		
		redirect.addAttribute("nno",nno);
		
		return "redirect:/detail.bo";
		
	}
	
	
	@RequestMapping("search.bo")
	public String selectListCon(@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,Model model
								,@RequestParam("search") String search) {       
		
		
		
		
		
		
		
		
		
		
		int listCount = noticeService.getListCountCon();
		
		
		//int currentPage=1;
		
		//if(request.getParameter("currentPage") !=null) {
		//	currentPage=Integer.parseInt(request.getParameter("currentPage"));
		//}
		//int pageLimit=10;
		
		
		
		//int boardLimit=5;
		//PageInfo pi=Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<CompanyNotice> list=noticeService.selectListCon(search);
		
		
		//request.setAttribute("pi", pi);
				
		
		
		
		model.addAttribute("list",list);
		model.addAttribute("search", search);
		
		return "notice/noticeListView";
		
		
		
	}
	
	@RequestMapping("deleteNotify.bo")
	public String deleteNotify(int nno,HttpServletRequest request) {
		System.out.println("NNO"+nno);
		
		noticeService.deleteNotify(nno);
		
		return "redirect:noticeList.bo";
	}
	
	
	@RequestMapping("deleteCall.bo")
	public String deleteCall(int nno,HttpServletRequest request) {
		
		System.out.println("nno"+nno);
		//게시글 삭제
		noticeService.deleteCall(nno);
		
		
		//게시글 조회
				//CompanyNotice notice=noticeService.selectNotice(nno);
		
				
		//첨부파일삭제
//		String fileName=notice.getChangeName();
//		
//
//		if(!fileName.equals("")) {
//			deleteFile(fileName,request);
//		}
		
		
		return "redirect:noticeList.bo";
	}
	
	
	
	
	
	@RequestMapping("insertTopBoard.bo")
	public String updateTopBoard(int nno) {
		
//		if(!file.getOriginalFilename().equals("")) {
//			if(notice.getChangeName() !=null) {
//				deleteFile(notice.getChangeName(),request);
//			}
//			String changeName=saveFile(file,request);
//			
//			notice.setOriginName(file.getOriginalFilename());
//			notice.setChangeName(changeName);
//		}
		
		
		
		
		
		noticeService.updateTopBoard(nno);
		
		
		
		//리스트 ㅍ로 전환
		//return mv;
		//return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
		
		
		
		return "redirect:/noticeList.bo";
	}
	
	@ResponseBody
	@RequestMapping(value="selectTopBoard.bo",produces="application/json; charset=utf-8")
	public String selectBoard(int nno,ModelAndView mv) {
		CompanyNotice notice=noticeService.selectNotice(nno);
		
		
		//JSONObject jsonUser=new JSONObject();
		
		//jsonUser.put("topBoard",notice.getTopBoard());
		//jsonUser.put("name",findUser.getName());
		//jsonUser.put("age",findUser.getAge());
		//jsonUser.put("gender",findUser.getGender()+"");
		
		
		//mv.addObject("notice",notice).setViewName("notice/noticeDetailView");
		
		//return mv;
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(notice);
		//return jsonUser.toString();
	}
	
	
	@RequestMapping("deleteTopBoard.bo")
	public String deleteTopBoard(int nno) {
		int result=noticeService.deleteTopBoard(nno);
		
		return "redirect:/noticeList.bo";
	}
	
	
}
