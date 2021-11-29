package com.kh.spring.eApproval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.eApproval.model.service.EApprovalService;
import com.kh.spring.eApproval.model.vo.EApproval;
import com.kh.spring.eApproval.model.vo.EForm;
import com.kh.spring.member.model.vo.Member;


@Controller
public class EApprovalController {
	
	@Autowired
	private EApprovalService eApprovalService;
	
	@RequestMapping(value="main.ap")
	public String selectAllList(Model model, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int empNo = Integer.parseInt(loginUser.getEmpNo());
		
		//approve wating : (내가 결재)결재 대기 문서
		ArrayList<EApproval> awList = eApprovalService.selectApproveList(empNo);
		model.addAttribute("awList", awList);
		
		//draft :(내가 기안, 진행중) 기안 진행문서
		ArrayList<EApproval> dList = eApprovalService.selectDraftList(empNo);
		model.addAttribute("dList", dList);
		
		//finish :(내가 기안, 완료, 반려) 완료 문서
		ArrayList<EApproval> fList = eApprovalService.selectFinishList(empNo);
		model.addAttribute("fList", fList);
		
		//새 결재 진행
		//양식 목록
		ArrayList<EForm> eFList = eApprovalService.selectEFList();
		session.setAttribute("eFList", eFList);
		
		//결재자 목록
		ArrayList<Member> mList = eApprovalService.selectMemberList();
		session.setAttribute("mList", mList);
		
		return "eApproval/eAMain";
	}
	
	@RequestMapping(value="eDetail.ap")
	public ModelAndView selectEApproval(@RequestParam("eNo") String eNo, ModelAndView mv) {
		
		EApproval ea = eApprovalService.selectEApproval(eNo);
		mv.addObject("ea", ea).setViewName("eApproval/eApprDetailView");
		System.out.println(ea);
		return mv;
	}
	
	@RequestMapping("enrollForm.ap")
	public ModelAndView enrollForm(@RequestParam("fNo") String fNo,
									@RequestParam("drafterId") int drafterId,
									@RequestParam("approverId") int approverId, ModelAndView mv) {
		//양식명
		EForm eForm = eApprovalService.selectEForm(fNo);
				
		//기안자 이름, 기안부서 
		Member drafter = eApprovalService.selectDrafter(drafterId);
		
		//결재자 직급, 결재자 이름
		Member approver = eApprovalService.selectApprover(approverId);
		
		EApproval ea = new EApproval(fNo, eForm.getFName(), 
									drafterId, drafter.getEmpName(), drafter.getDeptTitle(),
									approverId, approver.getEmpName(), approver.getJobName()
									);
		
		mv.addObject("ea", ea).setViewName("eApproval/eAEnrollForm");
		System.out.println(ea);
		return mv;
	}
	
	@RequestMapping(value="insertEApproval.ap", method = { RequestMethod.POST })
	public String insertEApproval(EApproval ea, HttpServletRequest request, @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		//업로드 파일이 있으면
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				ea.setOriginName(file.getOriginalFilename());
				ea.setChangeName(changeName);
			}
		}
		
		//문서 기안하기
		eApprovalService.insertEApproval(ea);
		return "redirect:main.ap";
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
			
		//파일 저장 위치
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		System.out.println("savePath" + savePath);
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//확장자 추출
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//저장 시 사용할 파일 이름
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			throw new CommException("file upload error");
		}
		
		return changeName;
	}
	
	@RequestMapping(value="update.ap", method = { RequestMethod.POST })
	public ModelAndView updateEApproval(EApproval ea, HttpServletRequest request, ModelAndView mv, @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		System.out.println("=========update==========");
		System.out.println(ea);
		
		//업로드 파일이 있으면
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				ea.setOriginName(file.getOriginalFilename());
				ea.setChangeName(changeName);
			}
		}		
		
		//문서 수정하기
		eApprovalService.updateEApproval(ea);
		String eNo = ea.getENo();
		
		ea = eApprovalService.selectEApproval(eNo);
		mv.addObject("ea", ea).setViewName("eApproval/eApprDetailView");
		
		return mv;
	}
	
	@RequestMapping(value="delete.ap", method = { RequestMethod.POST })
	public String deleteEApproval(EApproval ea) {
		
		//기안 취소하기
		//ea의 eNo만 가져오기
		String eNo = ea.getENo();
		
		System.out.println("====delete====");
		System.out.println(ea);
		
		eApprovalService.deleteEApproval(eNo);
		
		return "redirect:main.ap";
	}
	
	@RequestMapping(value="approve.ap", method= {RequestMethod.POST}) 
	public ModelAndView approveEApproval(EApproval ea, ModelAndView mv) {
		
		eApprovalService.approveEApproval(ea);
		String eNo = ea.getENo();
		
		ea = eApprovalService.selectEApproval(eNo);
		mv.addObject("ea", ea).setViewName("eApproval/eApprDetailView");
		
		return mv;
	}
	
	@RequestMapping("waitD.ap")
	public ModelAndView selectWaitEApprovalList(int empNo, ModelAndView mv) {
		
		//loginUser가 결재자, 진행중인 문서 리스트 가져오기
		ArrayList<EApproval> wList = eApprovalService.selectWaitEApprovalList(empNo);
		
		mv.addObject("wList", wList).setViewName("eApproval/waitDocumentsView");
				
		return mv;
	}
	
	@RequestMapping("draftD.ap")
	public ModelAndView selectDraftEApprovalList(int empNo, ModelAndView mv) {
		
		//loginUser가 기안자, 모든 문서 리스트 가져오기
		ArrayList<EApproval> drList = eApprovalService.selectDraftEApprovalList(empNo);
		
		mv.addObject("drList", drList).setViewName("eApproval/draftDocumentsView");
				
		return mv;
	}
	
	@RequestMapping("apprD.ap")
	public ModelAndView selectApproveEApprovalList(int empNo, ModelAndView mv) {
		
		//loginUser가 기안자, 모든 문서 리스트 가져오기
		ArrayList<EApproval> apList = eApprovalService.selectApproveEApprovalList(empNo);
		
		mv.addObject("apList", apList).setViewName("eApproval/approveDocumentsView");
				
		return mv;
	}
	
	@RequestMapping("eFormList.ap")
	public ModelAndView selectEFormList(ModelAndView mv) {
		
		ArrayList<EForm> efList = eApprovalService.selectEFormList();
		
		mv.addObject("efList", efList).setViewName("eApproval/eFormsView");
		
		return mv;
	}

}
