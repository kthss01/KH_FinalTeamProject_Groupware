package com.kh.spring.member.controller;

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

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.service.MemberServiceImpl2;
import com.kh.spring.member.model.vo.Member;

@SessionAttributes("loginUser") 
@Controller
public class MemberController {

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
		
		
		
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(
						@ModelAttribute Member m, 
						@RequestParam("post") String post,
						@RequestParam("address1") String address1,
						@RequestParam("address2") String address2,
						HttpSession session
						) {
		
//		m.setAddress(post + "/" + address1 + "/" + address2);

//		System.out.println("암호화 전 :" + m.getUserPwd());
		
		String encPwd = bCryptPasswordEncoder.encode(m.getLoginPwd());
		System.out.println("암호화 후 :" + encPwd);
		
//		memberService.checkPwdDuplication(encPwd);
		
		
//		m.setUserPwd(encPwd);
		
		memberService.insertMember(m);
//		System.out.println(m);
		
		session.setAttribute("msg", "회원가입 성공");
		
		return "redirect:/";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, Model model) {
		
		String encPwd = bCryptPasswordEncoder.encode(m.getLoginPwd());
//		System.out.println(encPwd);
		
		Member loginUser;
		loginUser = memberService.loginMember(bCryptPasswordEncoder ,m);
		
		System.out.println("loginUser : " + loginUser); 
		
		model.addAttribute("loginUser", loginUser);
		
		return "redirect:/";
		
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("update.me")
	public String updateMember(
			@ModelAttribute Member m, 
			@RequestParam("post") String post,
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
	
	@RequestMapping("delete.me")
	public String deleteMember(String userId) {
		
		memberService.deleteMember(userId);
		
		return "redirect:/logout.me";
	}
	
	
	
	
}
