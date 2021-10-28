package com.kh.spring.library.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.vo.SelectBoardListInfo;
import com.kh.spring.library.model.service.LibraryService;
import com.kh.spring.library.model.vo.LibraryBoard;

@Controller
public class LibraryController {
	
	@Autowired
	private LibraryService libraryService;
	
	@RequestMapping("boardList.li")
	public ModelAndView selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			ModelAndView mv, @RequestParam(value = "cno", required = false, defaultValue = "0") int cno) {

		int listCount = libraryService.selectListCount(cno);

		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 8);

		SelectBoardListInfo info = new SelectBoardListInfo(cno, pi);

		ArrayList<LibraryBoard> list = libraryService.selectBoardList(info);

		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("/library/libraryBoardListView");
		
		
		return mv;
	}
	
	@RequestMapping("insertBoard.li")
	public String insertBoard(LibraryBoard b, HttpServletRequest request,
							  @RequestParam(name="uploadFile",required=false) MultipartFile file ) {
		
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file,request);
			if(changeName != null) {
				b.setOriginName(file.getOriginalFilename());
				b.setChangeName(changeName);
				
				libraryService.insertBoard(b);
			}
		}
		return "redirect:/boardList.li";
	} 
	
	@RequestMapping("fileDownLoad.do")
	public void fileDownload(String fileName, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(fileName);
		
		libraryService.fileDownload(request, response, fileName);
		
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		// 저장 경로
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";

		System.out.println("savePath : " + savePath);

		// 업로드 시간정보로 파일명 변경해주는 작업
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf(".")); // 확장자 추출
		int random = (int) (Math.random() * 90000 + 10000);

		String changeName = currentTime + random + ext;

		// 파일 업로드
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
			throw new CommException("file Upload error");
		} catch (IOException e) {
			e.printStackTrace();
			throw new CommException("file Upload error");
		}
		return changeName;
	}

	// 업데이트용
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";

		System.out.println(savePath);

		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}

	
}
