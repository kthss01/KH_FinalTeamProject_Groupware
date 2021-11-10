package com.kh.spring.hr.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.hr.model.service.HrService;
import com.kh.spring.hr.model.vo.EmpInfo;
import com.kh.spring.hr.model.vo.VOccur;
import com.kh.spring.hr.model.vo.VRequest;
import com.kh.spring.hr.model.vo.VacationInfo;
import com.kh.spring.hr.model.vo.Work;
import com.kh.spring.hr.model.vo.WorkSInfo;
import com.kh.spring.member.model.vo.Member;

@Controller
public class HrController {

	@Autowired
	private HrService hrService;
	
	@RequestMapping("work.hr")
	public String selectWorkList(Model model, HttpSession session, HttpServletRequest request) {
		
		//현재 로그인 중인 사원의 사원번호
		Member loginUser = (Member)session.getAttribute("loginUser");
		int empNo = Integer.parseInt(loginUser.getEmpNo());
		
		//사원의 모든 근무정보 가져오기
		ArrayList<Work> wlist = hrService.selectWorkList(empNo);

		model.addAttribute("wlist", wlist);
		
		return "/hr/hrMain";
	}
	
	@RequestMapping("change.hr")
	public String changeWorkStatus(HttpSession session, HttpServletRequest request) {
		
		//사원번호
		Member loginUser = (Member)session.getAttribute("loginUser");
		int empNo = Integer.parseInt(loginUser.getEmpNo());
		
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
		
		//모든 상태 추가
		//WORK_STATUS_INFO 추가
		WorkSInfo wsi = new WorkSInfo(wNo, sCode);
		hrService.insertWorkStatus(wsi);
		
		return "redirect:work.hr";
	}
	
	@RequestMapping("vacation.hr")
	public String selectVacationList(Model model, HttpSession session, HttpServletRequest request) {
		//현재 로그인 중인 사원의 사원번호
		Member loginUser = (Member)session.getAttribute("loginUser");
		int empNo = Integer.parseInt(loginUser.getEmpNo());
		
		//사원의 모든 근무정보 가져오기
		ArrayList<Work> wlist = hrService.selectWorkList(empNo);

		model.addAttribute("wlist", wlist);
		
		//사원의 휴가정보 가져오기 
		VacationInfo vi = hrService.selectVacationInfo(empNo);
		model.addAttribute("vi", vi);
		
		//휴가사용 리스트 가져오기
		ArrayList<VRequest> vrList = hrService.selectVRequestList(empNo);
		model.addAttribute("vrList", vrList);
		
		//휴가생성 리스트 가져오기
		ArrayList<VOccur> volist = hrService.selectVOccurList(empNo);
		model.addAttribute("volist", volist);
		
		return "/hr/vacation";
	}
	
	@RequestMapping("empInfo.hr")
	public String selectEmpInfo(Model model, HttpSession session, HttpServletRequest request) {
		
		//현재 로그인 중인 사원의 사원번호
		Member loginUser = (Member)session.getAttribute("loginUser");
		int empNo = Integer.parseInt(loginUser.getEmpNo());
		
		//사원의 모든 근무정보 가져오기
		ArrayList<Work> wlist = hrService.selectWorkList(empNo);

		model.addAttribute("wlist", wlist);
		
		EmpInfo empInfo = hrService.selectEmpInfo(empNo);
		model.addAttribute("empInfo", empInfo);
		
		return "/hr/empInfoView";
	}
}
