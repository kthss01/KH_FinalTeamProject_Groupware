package com.kh.spring.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.community.model.service.CommunityService;
import com.kh.spring.community.model.vo.CommunityCategory;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.service.MemberServiceImpl2;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.survey.model.service.SurveyService;
import com.kh.spring.survey.model.vo.Survey;

@SessionAttributes("loginUser") 
@Controller
public class ManagerController {
	
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberServiceImpl2 memberService2;
	
	@Autowired
	private SurveyService surveyService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

	
	@RequestMapping("menagerMain.me")
	public String managerMain() {
	
		return "manager/managerMain";
	}
	
	@RequestMapping("managerMemberList.me")
	public String managerMemberList(Model model) {
		
		ArrayList<Member> list = memberService.selectMemberList();
		
		model.addAttribute(list);
		return "manager/managerMemberList";
	}
	
	@RequestMapping("managerMemberDetail.me")
	public String selectMember(String empNo, Model model) {
		
		Member member = memberService.selectMember(empNo);
		
		model.addAttribute(member);
		return "manager/managerMemberDetail";
		
	}
	
	@RequestMapping("managerCommProposal.me")
	public String managerProposalList(Model model) {
		
		ArrayList<CommunityCategory> list = communityService.selectCategoryList();
		model.addAttribute(list);
		
		return "manager/managerCommProposal";
	}
	
	@RequestMapping("managerCommunityList.me")
	public String managerCommunityList(Model model) {
		
		ArrayList<CommunityCategory> list = communityService.selectCategoryList();
		model.addAttribute(list);
		
		return "manager/managerCommunityList";
		
	}
	
	@RequestMapping("managerCategoryDetail.me")
	public String managerCategoryDetail(int cno, Model model) {
		
		CommunityCategory category = communityService.selectCategory(cno);
		model.addAttribute(category);
		
		return "manager/managerCategoryDetail";
	}
	
	
	@RequestMapping("managerSurveyListForm.me")
	public String managerSurveyListForm(Model model) {
		
		ArrayList<Survey> list = surveyService.selectSurveyList();
		model.addAttribute(list);
		
		return "manager/managerSurveyListForm";
		
	}
	
}
