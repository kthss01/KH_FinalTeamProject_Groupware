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
		int loginNo = 200;
		
//		사원의 모든 근무정보 가져오기
		ArrayList<Work> list = hrService.selectWorkList(loginNo);

		model.addAttribute("list", list);
		
		return "/hr/hrMain";
	}
	
	@RequestMapping("change.hr")
	public String changeWorkStatus(HttpServletRequest request) {
		
		int sNo = Integer.parseInt(request.getParameter("status"));
		
		return "/hr/hrMain";
	}
}
