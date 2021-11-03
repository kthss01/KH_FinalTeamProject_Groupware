package com.kh.spring.hr.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.hr.model.service.HrService;
import com.kh.spring.hr.model.vo.Work;
import com.kh.spring.member.model.vo.Member;

@Controller
public class HrController {

	@Autowired
	private HrService hrService;
	
	@RequestMapping("main.hr")
	public String selectWorkList(Model model) {
		
//		Member loginUser = (Member) model.getAttribute("loginUser");
//		int loginNo = loginUser.getEmpNo();
		
//		현재 로그인중인 사원의 사원번호
		int empNo = 200;
		
//		사원의 모든 근무정보 가져오기
		ArrayList<Work> wlist = hrService.selectWorkList(empNo);

		model.addAttribute("wlist", wlist);
		
		return "/hr/hrMain";
	}
	
	@RequestMapping("change.hr")
	public String changeWorkStatus(HttpServletRequest request) {
		
		//사원번호
		//Member loginUser = (Member) model.getAttribute("loginUser");
		int empNo = 200;
		
		//상태코드
		int sCode = Integer.parseInt(request.getParameter("status"));

		//근무번호
		String wNo = (String)request.getParameter("wNo");
		if(wNo == null) {
			wNo = null;
		}
		
		//출근 일때,
		if(sCode==1) {
			hrService.insertWork(empNo);
			
		}
		//퇴근 일때
		else if(sCode==2) {
			
			hrService.updateWork(wNo);
		}
		
		//WORK_STATUS_INFO 추가
		//모든 상태 추가
//		hrService.insertWorkStatus(wNo, sCode);
		
		return "/hr/hrMain";
	}
}
