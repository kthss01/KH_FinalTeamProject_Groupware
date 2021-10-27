package com.kh.spring.community.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.service.CommunityService;
import com.kh.spring.community.model.vo.CommunityAttachment;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.CommunityCategory;
import com.kh.spring.community.model.vo.CommunityReply;
import com.kh.spring.community.model.vo.SelectBoardListInfo;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	@RequestMapping("boardList.co")
	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model, @RequestParam(value = "cno", required = false, defaultValue = "1") int cno) {

		int listCount = communityService.selectListCount(cno);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		SelectBoardListInfo info = new SelectBoardListInfo(cno, pi);

		ArrayList<CommunityBoard> list = communityService.selectBoardList(info);

		CommunityCategory category = communityService.selectCategory(cno);
				
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("category", category);

		return "/community/communityBoardListView";
	}

	@GetMapping("enrollBoardForm.co")
	public ModelAndView enrollBoardFrom(ModelAndView mv , int cno) {
		
		ArrayList<CommunityCategory> list = communityService.selectCategoryList();
		mv.addObject("categoryList",list).setViewName("/community/enrollBoardForm");
		mv.addObject("cno",cno);
		return mv;
	}

	@GetMapping("detail.co")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {

		CommunityBoard b = communityService.selectBoard(bno);
		
		//조회수 증가
		communityService.countBoard(bno);
		
		ArrayList<CommunityAttachment> at = communityService.selectAttachmentList(bno);
		mv.addObject("b", b);
		mv.addObject("at",at);
		mv.setViewName("/community/communityBoardDetailView");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "insertAttachment.co", method = { RequestMethod.GET, RequestMethod.POST })
	public void insertAttachment(CommunityAttachment at, HttpServletRequest request,
			@RequestParam("article_file") List<MultipartFile> multipartFile) {

		System.out.println("업로드한 파일 : " + multipartFile);
		int nextBno = communityService.selectSeqBno();
		at.setBno(nextBno-1);

		if (!multipartFile.get(0).getOriginalFilename().equals("")) {
			for (MultipartFile file : multipartFile) { // 파일들을 Attachment 테이블에 하나씩 insert해줌
				System.out.println("originName : " + file.getOriginalFilename());
				String changeName = saveFile(file, request);
				System.out.println("changeName : " + changeName);
				if (changeName != null) {
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(changeName);
					communityService.insertCommunityAttachment(at);
				}

			}
		}
	}

	@RequestMapping(value = "insertBoard.co", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertBoard(CommunityBoard b,HttpServletRequest request) {

		 communityService.insertBoard(b);

		return "redirect:/boardList.co";
	}
	@RequestMapping(value = "updateBoard.co", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateBoard(CommunityBoard b,  HttpServletRequest request) {
		

		communityService.updateBoard(b);
		
		return "redirect:/boardList.co";
	}
	
	@ResponseBody
	@RequestMapping("insertReply.co")
	public String insertReply(CommunityReply r) {
				
		
		 int result = communityService.insertReply(r);
	
		 return String.valueOf(result);
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectReplyList.co",produces="application/json; charset=utf-8")
	public String selectReplyList(int bno) {
		
		ArrayList<CommunityReply> list = communityService.selectReplyList(bno);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="selectReComentList.co",produces="application/json; charset=utf-8")
	public String selectReComentList(CommunityReply r) {
		
		
		ArrayList<CommunityReply> list = communityService.selectReComentList(r);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("deleteReply.co")
	public String deleteReply(CommunityReply r) {
				
		
		 int result = communityService.deleteReply(r);
	
		 return String.valueOf(result);
	}
	
	@ResponseBody	
	@RequestMapping(value="categoryList.co",produces="application/json; charset=utf-8")
	public String selectCategoryList(CommunityCategory r) {
		
		
		ArrayList<CommunityCategory> list = communityService.selectCategoryList();
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
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

	@ResponseBody
	@RequestMapping(value = "/file-upload", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("article_file") List<MultipartFile> multipartFile,
			HttpServletRequest request) {

		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if (multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {

				for (MultipartFile file : multipartFile) {
					fileRoot = contextRoot + "resources/upload/";
					System.out.println(fileRoot);

					String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
					String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

					File targetFile = new File(fileRoot + savedFileName);
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장

					} catch (Exception e) {
						// 파일삭제
						FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strResult;
	}

}
