package com.kh.spring.eApproval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.eApproval.model.service.EApprovalService;
import com.kh.spring.eApproval.model.vo.EApproval;
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
		
		return "eApproval/eAMain";
	}
}
