package com.kh.spring.survey.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.common.PageInfo;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.survey.model.service.SurveyService;
import com.kh.spring.survey.model.vo.Survey;

@SessionAttributes("loginUser") 
@Controller
public class SurveyController {
	
	
	@Autowired
	private SurveyService surveyService;
	
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("managerSurveyListForm.sv")
	public String managerSurveyListForm(@ModelAttribute ArrayList<Survey> survey, Model model,PageInfo pageInfo) {
		
		ArrayList<Survey> list = surveyService.selectSurveyList(pageInfo);
		model.addAttribute(list);
		
		System.out.println(list);
		
		return "survey/managerSurveyListForm";
	}
	
//	@RequestMapping(value="/", method = RequestMethod.POST)
//	public String managerSurveyListForm(Model model) {
//		
//		ArrayList<Survey> list = surveyService.selectSurveyList();
//		model.addAttribute(list);
//		
//		return "survey/managerSurveyListForm";
//	}
//	
	

//	@RequestMapping("surveyDetailForm.sv")
//	public String surveyDetailForm(Model model) {
//		
//		ArrayList<Survey> list = surveyService.selectSurveyList();
//		
//		model.addAttribute(list);
//		return  "survey/surveyDetailForm";
//	}
	
	@RequestMapping("surveyListForm.sv")
	public String surveyListForm(Model model) {
		
		ArrayList<Survey> list = surveyService.selectSurveyList();
		
		model.addAttribute(list);
		
		return "survey/managerSurveyListForm";
	}
	
	@RequestMapping("surveyDetailForm.sv")
	public String surveyDetailForm(Model model,String SurveyNo) {
		
		Survey survey = surveyService.selectSurvey(SurveyNo);
		String address = "survey/";
		
		if(survey.equals(null)) {
			address = "/redirect";
			
		} else {
			address += "surveyDetailForm";
			model.addAttribute(survey);
		}
		
		return address;
	}
	
	@RequestMapping("surveyQuestionInsertForm.sv")
	public String insertSurvey(String surveyNo, HttpSession session,Model model) {
		
		Survey survey = surveyService.selectSurvey(surveyNo);
		model.addAttribute(survey);
		session.setAttribute("msg", "설문 연동 성공");
		
		return "survey/surveyQuestionInsertForm";
		
	}
	
	@RequestMapping("deleteSurvey.sv")
	public String deleteSurvey(String surveyNo, HttpSession session) {
		
		int result = surveyService.deleteSurvey(surveyNo);
		
		if (result > 0) session.setAttribute("msg", "success to delete");
		
		return "redirect/";
	}
	
	
	@RequestMapping("surveyInsertForm.sv")
	public String surveyInsertForm() {
		
		return "survey/surveyInsertForm";
		
	}
	
	@RequestMapping("updateSurvey.sv")
	public String updateSurvey(Survey survey) {
		
		int result = surveyService.updateSurvey(survey);
		
		return "redirect/";
	}
}
