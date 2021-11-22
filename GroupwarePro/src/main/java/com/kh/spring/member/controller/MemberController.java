package com.kh.spring.member.controller;

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

import com.kh.spring.community.model.service.CommunityService;
import com.kh.spring.community.model.vo.CommunityCategory;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.service.MemberServiceImpl2;
import com.kh.spring.member.model.vo.Member;

@SessionAttributes("loginUser") 
@Controller
public class MemberController {
	
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberServiceImpl2 memberService2;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping("loginForm.me")
	public String loginForm(){
		return "member/memberLoginForm";
	}
	
	// 로그아웃 변경 (@SessionAttributes)
	@RequestMapping("logout.me")
	public String logoutMember(SessionStatus status) {
		
//		if(status.isComplete()){
//		HttpSession session = request.getSession();
//		session.invalidate();
		status.setComplete();
		
		return "member/memberLoginForm";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("insertMember.me")
	public String insertMember(
						@ModelAttribute Member m, 
	//					@RequestParam("post") String post,
						HttpSession session
						) {
		
		String encPwd = bCryptPasswordEncoder.encode(m.getLoginPwd());
//		memberService.checkPwdDuplication(encPwd);
		m.setMemberPwd(encPwd);
		
		memberService.insertMember(m);
//		System.out.println(m);
		System.out.println(m.getEmpNo());
		System.out.println(m.getLoginPwd());
		System.out.println(m.getLoginId());
		
		
		session.setAttribute("msg", "회원가입 성공");
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, Model model) {
		
		String encPwd = bCryptPasswordEncoder.encode(m.getLoginPwd());
//		System.out.println(encPwd);
		Member loginUser;
		loginUser = memberService.loginMember(bCryptPasswordEncoder ,m);
		
		System.out.println("loginUser : " + loginUser); 
		
		model.addAttribute("loginUser", loginUser);
		
		return "main";
		
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("update.me")
	public String updateMember(
			@ModelAttribute Member m, 
//			@RequestParam("post") String post,
//			@RequestParam("address1") String address1,
//			@RequestParam("address2") String address2,
			HttpSession session,
			Model model) throws Exception {
		
//		m.setAddress(post + "/" + address1 + "/" + address2);
//		Member userInfo = memberService2.updateMember(m);	
		
		
		Member userInfo = memberService.updateMember(m);
		
		model.addAttribute("loginUser", userInfo);
		
		return "member/myPage";
	}
	
	@RequestMapping("updatePassword.me")
	public String updatePassword(String updateEmpNo,String newPwd, HttpSession session,SessionStatus status) {
		
		Member m = new Member();
		String encPwd = bCryptPasswordEncoder.encode(newPwd);

		m.setEmpNo(updateEmpNo);
		m.setLoginPwd(encPwd);
		
		int result = memberService.updatePassword(m);
		
		if(!status.isComplete()) {
			status.setComplete();
		}
		
		return "member/memberLoginForm";
	}
	
	
	@RequestMapping("delete.me")
	public String deleteMember(String userId) {
		
		memberService.deleteMember(userId);
		
		return "redirect:/logout.me";
	}
	
	@RequestMapping("selectMember.me")
	public Member selectMember(String empNo,Model model) {
		
		Member result = memberService.selectMember(empNo);
		model.addAttribute("result",result);
		
		return result;
		
	}
	
	@RequestMapping("findForm.me")
	public String findCount(Model model) {
		
		return "member/memberFindForm";
	}
	
	@RequestMapping(value="checkMember.me",method= RequestMethod.GET)
	@ResponseBody
	public String checkMember(String empNo) {
		String result = memberService.checkMember(empNo) > 0 ? "valid" : "invalid";
		return result;
	}
	
	@RequestMapping(value="checkMemberId.me",method= RequestMethod.GET)
	@ResponseBody
	public String checkMemberId(String loginId) {
		String result = memberService.checkMemberId(loginId) > 0 ? "invalid" : "valid";
		return result;
	}
	
	@RequestMapping(value="searchLoginId.me",method= RequestMethod.GET)
	@ResponseBody
	public String searchLoginId(String empNo,Model model) {
		
		String result = memberService.searchLoginId(empNo);
		return result;
	}
	
	
	@RequestMapping(value="checkEmpNoAndId.me",method= RequestMethod.GET)
	@ResponseBody
	public String checkEmpNoAndId(String empNo,String loginId) {
		
		String result = null;
		if(memberService.checkMember(empNo) > 0 ) {
			result = memberService.checkMemberId(loginId) > 0 ? "valid" : "invalid";
		} else {
			result = "invalid";
		}
		return result;
	}
	
}
