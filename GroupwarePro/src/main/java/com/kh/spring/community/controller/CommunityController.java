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

	@GetMapping("detail.co")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {

		CommunityBoard b = communityService.selectBoard(bno);

		// 조회수 증가
		communityService.countBoard(bno);

		mv.addObject("b", b);
		/*
		 * mv.addObject("at", at);
		 */ mv.setViewName("/community/communityBoardDetailView");
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
	public void checkOriginFiles(@RequestParam(value = "origin_files[]",required = false) List<String> originFiles, int bno , HttpServletRequest request) {
		ArrayList<CommunityAttachment> originFileList = communityService.selectAttachmentList(bno);

		
		System.out.println("넘어온 파일 리스트" + originFiles);
		
		if(originFiles==null) {  // 기존 파일리스트가 없으면 모두 삭제된 것 모두 삭제 
		
			for(CommunityAttachment at : originFileList) {
				communityService.deleteCommunityAttachment(at); 	//DB 파일 삭제
				deleteFile(at.getChangeName(),request);				//실제 파일 삭제
			}
		}else {
			if (!originFiles.isEmpty()) {
				for (String file : originFiles) {
		
						if ((originFileList.contains(file))) { 
							
							//기존에 있던 파일과 수정되서 올라온 기존파일배열 비교
							//기존 파일리스트와 비교해서 사라진 게 있으며 db에서 지워줌
							
							//현재 파일명과 글 번호 정보를 담고 있는 첨부파일 info객체 생성
							CommunityAttachment info = new CommunityAttachment();
							info.setOriginName(file);
							info.setBno(bno);
							
							//info 객체로 서버에 올라간 변경 파일명을 조회해옴
							CommunityAttachment result = communityService.selectAttachment(info);
							String deleteFileChangeName = result.getChangeName();

							//info 객체 넘겨서 DB에 있는 첨부파일 삭제
							communityService.deleteCommunityAttachment(info);
							//서버에 있는 파일 삭제 
							deleteFile(deleteFileChangeName,request);
						}
					
				}
			}
			
		}
		
		


	}

	@RequestMapping(value = "updateBoard.co", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateBoard(CommunityBoard b, HttpServletRequest request,
			@RequestParam("article_file") List<MultipartFile> multipartFile) {

		
		System.out.println("넘어온 새로운 파일 : " + multipartFile);
		
		ArrayList<CommunityAttachment> originFileList = communityService.selectAttachmentList(b.getBno());

		System.out.println("originFileList :" +  originFileList );
		
		
		String changeName = "";
		CommunityAttachment at = null;

		
		 communityService.updateBoard(b);
		 
		if (!multipartFile.isEmpty()) {
			if (!multipartFile.get(0).getOriginalFilename().equals("")) {
				for (MultipartFile newFile : multipartFile) { // 파일들을 Attachment 테이블에 하나씩 insert해줌

					if (!(originFileList.contains(newFile.getOriginalFilename()))
								|| originFileList.isEmpty()) {  //기존 파일리스트에 존재하지 않는 파일이면 새로 db에 insert해줌
						
						changeName = saveFile(newFile, request);
						
						at = new CommunityAttachment();
						if (changeName != null) {
							at.setOriginName(newFile.getOriginalFilename());
							at.setChangeName(changeName);
							at.setBno(b.getBno());
							
							System.out.println("등록될 첨부파일 : " + at);
							
							int result = communityService.updateCommunityAttachment(at);
							System.out.println(result+">>>>>");
						}
					}
				}
			}

		}

		return "redirect:/boardList.co";
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

	/*
	 * @RequestMapping("selectAttachment.co") public ArrayList
	 */
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
