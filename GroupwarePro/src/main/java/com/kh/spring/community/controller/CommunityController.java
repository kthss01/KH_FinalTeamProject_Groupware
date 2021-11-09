package com.kh.spring.community.controller;

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
import com.kh.spring.common.SelectBoardListInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.service.CommunityService;
import com.kh.spring.community.model.vo.CommunityAttachment;
import com.kh.spring.community.model.vo.CommunityBoard;
import com.kh.spring.community.model.vo.CommunityCategory;
import com.kh.spring.community.model.vo.CommunityReply;

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
	public ModelAndView enrollBoardFrom(ModelAndView mv, int cno) {

		ArrayList<CommunityCategory> list = communityService.selectCategoryList();
		mv.addObject("categoryList", list).setViewName("/community/enrollBoardForm");
		mv.addObject("cno", cno);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("delete.co")
	public String deleteBoard(int bno,HttpServletRequest request) {
		
		
		ArrayList<CommunityAttachment> atList = communityService.selectAttachmentList(bno);
		
		for(CommunityAttachment at : atList) {
			deleteFile(at.getChangeName(),request);
		}

	    int result =  communityService.deleteBoard(bno);
		
		return String.valueOf(result);

	}
	

	@GetMapping("detail.co")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {

		CommunityBoard b = communityService.selectBoard(bno);

		// 조회수 증가
		communityService.countBoard(bno);

		mv.addObject("b", b);
		mv.setViewName("/community/communityBoardDetailView");
		
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "selectAttachmentList.co", produces = "application/json; charset=utf-8")
	public String selectAttachmentList(int bno) {

		ArrayList<CommunityAttachment> list = communityService.selectAttachmentList(bno);

		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "insertAttachment.co", method = { RequestMethod.GET, RequestMethod.POST })
	public void insertAttachment(CommunityAttachment at, HttpServletRequest request,
			@RequestParam("article_file") List<MultipartFile> multipartFile) {

		int nextBno = communityService.selectSeqBno();
		at.setBno(nextBno - 1);

		if (!multipartFile.isEmpty()) {
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
	}

	@ResponseBody
	@RequestMapping("originFileCheck.co")
	public void checkOriginFiles(@RequestParam(value = "origin_files[]", required = false) List<String> requestFiles,
			int bno, HttpServletRequest request) {
		ArrayList<CommunityAttachment> originFileList = communityService.selectAttachmentList(bno);
		ArrayList<CommunityAttachment> resultList = new ArrayList();;


		if (requestFiles == null) { // 기존 파일리스트가 없으면 모두 삭제된 것 모두 삭제

			for (CommunityAttachment at : originFileList) {
				communityService.deleteCommunityAttachment(at); // DB 파일 삭제
				deleteFile(at.getChangeName(), request); // 실제 파일 삭제
			}

		} else if (!requestFiles.isEmpty()) { // 넘어온 파일리스트가 있다면

			for (String requestFile : requestFiles) { // 넘어온 파일명 리스트들로 

				CommunityAttachment info = new CommunityAttachment();
				info.setOriginName(requestFile);
				info.setBno(bno);

				// db에 올라가있는 파일 객체들 만들어와서 resultList에 먼저 올려주고
				resultList.add(communityService.selectAttachment(info)); 

			}

			for (CommunityAttachment keepFile : resultList) { //db객체들 리스트들을
				originFileList.remove(keepFile); // 기존 파일리스트에서 지워주면 남은 파일은 삭제되야할 파일이다. 

			}

			for (CommunityAttachment deleteFile : originFileList) { // 남은 파일들 포문 돌려서 삭제 진행 

				communityService.deleteCommunityAttachment(deleteFile); // 서버에 있는 파일 삭제
				deleteFile(deleteFile.getChangeName(), request);

			}

		}

	}
	
	@ResponseBody
	@RequestMapping(value = "updateBoard.co", method = { RequestMethod.GET, RequestMethod.POST })
	public void updateBoard(CommunityBoard b, HttpServletRequest request,
			@RequestParam("article_file") List<MultipartFile> multipartFile) {


		String changeName = "";
		CommunityAttachment at = null;

		communityService.updateBoard(b);

		if (!multipartFile.isEmpty()) {
			if (!multipartFile.get(0).getOriginalFilename().equals("")) {
				for (MultipartFile newFile : multipartFile) { // 파일들을 Attachment 테이블에 하나씩 insert해줌

					changeName = saveFile(newFile, request);
					at = new CommunityAttachment();
					if (changeName != null) {
						at.setOriginName(newFile.getOriginalFilename());
						at.setChangeName(changeName);
						at.setBno(b.getBno());

						communityService.updateCommunityAttachment(at);
					}
				}
			}
		}
	}

	@RequestMapping(value = "insertBoard.co", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertBoard(CommunityBoard b, HttpServletRequest request) {

		communityService.insertBoard(b);

		return "redirect:/boardList.co";
	}

	@ResponseBody
	@RequestMapping("insertReply.co")
	public String insertReply(CommunityReply r) {

		int result = communityService.insertReply(r);

		return String.valueOf(result);
	}

	@ResponseBody
	@RequestMapping(value = "selectReplyList.co", produces = "application/json; charset=utf-8")
	public String selectReplyList(int bno) {

		ArrayList<CommunityReply> list = communityService.selectReplyList(bno);

		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "selectReComentList.co", produces = "application/json; charset=utf-8")
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
	@RequestMapping(value = "categoryList.co", produces = "application/json; charset=utf-8")
	public String selectCategoryList(CommunityCategory r) {

		ArrayList<CommunityCategory> list = communityService.selectCategoryList();

		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "bestBoardList.co", produces = "application/json; charset=utf-8")
	public String selectBestBoardList() {

		ArrayList<CommunityBoard> list = communityService.selectBestBoardList();
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

}
