package com.kh.spring.survey.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.survey.model.service.SurveyService;
import com.kh.spring.survey.model.vo.Essay;
import com.kh.spring.survey.model.vo.Survey;

@SessionAttributes("loginUser") 
@Controller
public class SurveyController {
	
	
	@Autowired
	private SurveyService surveyService;
	
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("managerSurveyListForm.sv")
	public String managerSurveyListForm(Model model) {
		
		
		ArrayList<Survey> list = surveyService.selectSurveyList();
		model.addAttribute("list", list);
		
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
		
		ArrayList<Survey> list = surveyService.selectAbleSurveyList();
		
		model.addAttribute("list",list);
		
		return "survey/SurveyListForm";
	}
	
	@RequestMapping("surveyDetailForm.sv")
	public String surveyDetailForm(Model model,String surveyNo) {
		
		Survey survey = surveyService.selectSurvey(surveyNo);
		model.addAttribute("survey",survey);
		
		return "survey/surveyManagerDetailForm";
	}
	
	
	@RequestMapping("surveyQuestionInsertForm.sv")
	public String insertSurvey(String surveyNo, HttpSession session,Model model) {
		
		Survey survey = surveyService.selectSurvey(surveyNo);
		ArrayList<Essay> list = surveyService.selectQuestionList(surveyNo);
		
		model.addAttribute("survey",survey);
		model.addAttribute("list",list);
		
		session.setAttribute("msg", "설문 연동 성공");
		
		return "survey/surveyQuestionInsertForm";
	}
	 

	@RequestMapping("surveyQuestionForm.sv")
	public String surveyQuestionForm(String surveyNo, Model model) {
		
		Survey survey = surveyService.selectSurvey(surveyNo);
		ArrayList<Essay> list = surveyService.selectQuestionList(surveyNo);
		
		model.addAttribute("survey",survey);
		model.addAttribute("list",list);
		
		return "survey/surveyQuestionForm";
	}
	
	
	@RequestMapping("deleteSurvey.sv")
	public String deleteSurvey(String surveyNo, HttpSession session) {
		
		int result = surveyService.deleteSurvey(surveyNo);
		
		if (result > 0) session.setAttribute("msg", "success to delete");
		
		return "redirect:/managerSurveyListForm.sv";
	}
	
	
	@RequestMapping("surveyInsertForm.sv")
	public String surveyInsertForm() {
		
		return "survey/surveyInsertForm";
		
	}
	
	@RequestMapping("insertSurvey.sv")
	public String insertSurvey(@ModelAttribute Survey survey) {
		
		int result = surveyService.insertSurvey(survey);
		
		return "redirect:/managerSurveyListForm.sv";
	}
	
	@RequestMapping("surveyUpdateForm.sv")
	public String surveyUpdateForm(Model model,String surveyNo) {
		
		Survey survey = surveyService.selectSurvey(surveyNo);
		model.addAttribute("survey",survey);

		return "survey/surveyUpdateForm";
		
	}
	
	@RequestMapping("updateSurvey.sv")
	public String updateSurvey(@ModelAttribute Survey survey,String statement) {
		
		if(statement != null) {
			survey.setStatement(statement);}
		int result = surveyService.updateSurvey(survey);
		
		return "redirect:/managerSurveyListForm.sv";
		
	}
	
	@RequestMapping("invalidateSurvey.sv")
	public String invalidateSurvey(Survey survey,Model model) {
		
//		model.addAttribute(result);
		
		return "invalidateSurvey";
	}
	
	
	@RequestMapping(value="insertQuestion.sv",method=RequestMethod.POST)
	@ResponseBody
	public String insertQuestion(@RequestParam(value="essayText[]")List<String> list,  String essayText, String sequence, String surveyNo) {

	
		System.out.println("***** " + list);
		
//		Essay essay = new Essay();
//		essay.setEssayText(essayText);
//		essay.setSequence(sequence);
//		essay.setSurveyNo(surveyNo);
//		
//		int result = surveyService.insertQuestion(essay);
//	
	return "";
	}
}
