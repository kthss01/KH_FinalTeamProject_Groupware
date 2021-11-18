package com.kh.spring.eApproval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		model.addAttribute("eFList", eFList);
		
		//결재자 목록
		ArrayList<Member> mList = eApprovalService.selectMemberList();
		model.addAttribute("mList", mList);
		
		return "eApproval/eAMain";
	}
	
	@RequestMapping(value="eDetail.ap")
	public ModelAndView selectEApproval(@RequestParam("eNo") String eNo, ModelAndView mv) {
		
		EApproval ea = eApprovalService.selectEApproval(eNo);
		mv.addObject("ea", ea).setViewName("eApproval/eApprDetailView");
		
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
		
		return mv;
	}
	
	@RequestMapping(value="insertEApproval.ap", method = { RequestMethod.POST })
	public String insertEApproval(EApproval ea) {
		
		//결재 기안하기
		eApprovalService.insertEApproval(ea);
		return "redirect:main.ap";
		
		//완료하고 상세페이지로 이동
//		return "reidrect:eDetail.ap?eNo=" + eNo;
	}
	
	
	
	@RequestMapping(value="approve.ap", method= {RequestMethod.POST}) 
	public ModelAndView updateEApproval(EApproval ea, ModelAndView mv) {
		
		eApprovalService.updateEApproval(ea);
		String eNo = ea.getENo();
		
		ea = eApprovalService.selectEApproval(eNo);
		mv.addObject("ea", ea).setViewName("eApproval/eApprDetailView");
		
		return mv;
	}
	
}
