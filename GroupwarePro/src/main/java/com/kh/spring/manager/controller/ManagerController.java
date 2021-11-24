package com.kh.spring.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
		
		model.addAttribute("list",list);
		return "manager/managerMemberList";
	}
	
	@RequestMapping("managerMemberDetail.me")
	public String selectMember(String empNo, Model model) {
		
		Member member = memberService.selectMember(empNo);
		
		model.addAttribute(member);
		return "manager/managerMemberDetail";
		
	}
	
	@RequestMapping("managerCommProposal.me")
	public ModelAndView managerProposalList(ModelAndView mv) {
		
		ArrayList<CommunityCategory> list = communityService.selectCategoryList();
		mv.addObject("list",list);
		mv.setViewName("/manager/managerCommProposal");
		return mv;
	}
	
	@RequestMapping("managerCommunityList.me")
	public ModelAndView managerCommunityList(ModelAndView mv) {
		
		ArrayList<CommunityCategory> list = communityService.selectCategoryList();
		mv.addObject("list",list);
		mv.setViewName("/manager/managerCommunityList");		
		return mv;
		
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
		model.addAttribute("list",list);
		
		return "manager/managerSurveyListForm";
		
	}
	
	
	@RequestMapping("managerMemberGraph.me")
	public String managerMemberGraph() {
		return "manager/managerMemberGraph";
	}
	
	
	@RequestMapping(value="sortMemberList.me",method= RequestMethod.POST,produces="application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<Member> checkMember(String value,Model model) {
		ArrayList<Member> list = memberService.sortMemberList(value);
		model.addAttribute("list",list);
		System.out.println(list);
		
		return list;
	}
}
