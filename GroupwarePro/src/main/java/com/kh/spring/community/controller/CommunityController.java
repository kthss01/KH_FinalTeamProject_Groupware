package com.kh.spring.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.service.CommunityService;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.SelectBoardListInfo;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	@RequestMapping("boardList.co")
	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model,@RequestParam(value="cno", required = false, defaultValue="1") int cno) {

		

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
	
	@GetMapping("detail.co")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		
		CommunityBoard b = communityService.selectBoard(bno);
		mv.addObject("b",b).setViewName("/community/communityBoardDetailView");
		return mv;
	}
	
	
	
	@PostMapping("insert.co")
	public String insertBoard(CommunityBoard b,HttpServletRequest request,
							  @RequestParam(name="uploadFile",required=false) MultipartFile file ) {
		
		System.out.println(b);
		System.out.println("==============================");
		System.out.println(file);
		/*
		 * if(!file.getOriginalFilename().equals("")) { //파일이 없으면 빈 문자열로 넘어온다 String
		 * changeName = saveFile(file,request);
		 * 
		 * if(changeName != null ) { b.setOriginName(file.getOriginalFilename());
		 * b.setChangeName(changeName); } }
		 * 
		 * communityService.insertBoard(b);
		 */
		
		return"redirect:boardList.co";
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		//저장 경로 
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		System.out.println(savePath);
		
		
		//업로드 시간정보로 파일명 변경해주는 작업
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf(".")); //확장자 추출
		
		String changeName = currentTime + ext;
		
		//파일 업로드
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException  e) {
			e.printStackTrace();
			throw new CommException("file Upload error");
		} catch( IOException e) {
			e.printStackTrace();
			throw new CommException("file Upload error");
		}
		return changeName;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		System.out.println(savePath);
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();
	}
	
	
}
