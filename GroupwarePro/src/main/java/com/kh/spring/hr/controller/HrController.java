package com.kh.spring.hr.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.spring.community.model.vo.CommunityCategory;
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
	public ModelAndView selectWorkList(HttpSession session, ModelAndView mv) {
		
		//현재 로그인 중인 사원의 사원번호
		Member loginUser = (Member)session.getAttribute("loginUser");
		int empNo = Integer.parseInt(loginUser.getEmpNo());
		
		//사원의 오늘 근무정보 가져오기
		Work w = hrService.selectWork(empNo);
		
		mv.addObject("w", w);
		mv.setViewName("hr/hrMain");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("selectWorkList.hr")
	public ModelAndView selectWorkList2(HttpSession session, ModelAndView mv
										, @RequestParam("year") int year
										, @RequestParam("month") int month
										, @RequestParam("empNo") int empNo) {
		
		String strYear = Integer.toString(year).substring(2);
		String strMonth = null;
		if(month < 10) {
			strMonth = "0" + month;
		}
		else {
			strMonth = Integer.toString(month);
		}
		
		String strDate = strYear + strMonth + "01";
		
		Work work = new Work(empNo, strDate);
		
		//사원의 이번달 근무정보 가져오기
		ArrayList<Work> wlist = hrService.selectWorkList(work);
		
		mv.addObject("wlist", wlist);
		
		mv.addObject("year", year);
		mv.addObject("month", month);
		
		mv.setViewName("hr/workListView");
		
		return mv;
	}
	
	@RequestMapping("change.hr")
	public String changeWorkStatus(Model model, HttpSession session, HttpServletRequest request) {
		
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
		
		if(request.getParameter("main").equals("1")) {
			Work w = hrService.selectWork(empNo);
			
			model.addAttribute("w", w);
			return "main";
		}
		else {
			return "redirect:work.hr";
		}
	}
	
	@RequestMapping("vacation.hr")
	public String selectVacationList(Model model, HttpSession session, HttpServletRequest request) {
		//현재 로그인 중인 사원의 사원번호
		Member loginUser = (Member)session.getAttribute("loginUser");
		int empNo = Integer.parseInt(loginUser.getEmpNo());
		
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
		
		EmpInfo empInfo = hrService.selectEmpInfo(empNo);
		model.addAttribute("empInfo", empInfo);
		
		return "/hr/empInfoView";
	}
	
	
	//상태조회
	@ResponseBody
	@RequestMapping(value = "selectWorkSInfoList.hr", produces = "application/json; charset=utf-8")
	public String selectWorkSInfoList(@RequestParam("wNo") String wNo) {
		
		ArrayList<WorkSInfo> list = hrService.selectWorkSInfoList(wNo);

		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
}
