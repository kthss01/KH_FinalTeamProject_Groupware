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
import com.kh.spring.survey.model.vo.EssayAnswer;
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
	 

	@RequestMapping("surveyAnswerForm.sv")
	public String surveyAnswerForm(String surveyNo, Model model) {
		
		Survey survey = surveyService.selectSurvey(surveyNo);
		ArrayList<Essay> list = surveyService.selectQuestionList(surveyNo);
		
		model.addAttribute("survey",survey);
		model.addAttribute("list",list);
		
		return "survey/surveyAnswerForm";
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
	public String insertQuestion(@RequestParam(value="essayList[]")List<String> essayList, String surveyNo) {
		
		List<Essay> list = new ArrayList<Essay>(essayList.size());
		
		for ( int i = 0; i < essayList.size(); i++) {
			Essay e = new Essay();
			e.setSequence(Integer.toString(i));
			e.setEssayText(essayList.get(i));
			e.setSurveyNo(surveyNo);
			
			list.add(e);
		}
		
     	int result = surveyService.insertQuestionList(list);
     	int result2 = surveyService.updateSurveyQustionCount(surveyNo);
		
	return "survey/managerSurveyListForm";
	}
	

	@RequestMapping(value="insertAnswer.sv",method=RequestMethod.POST)
	public String insertAnswer(@RequestParam(value="questionList[]")List<String> essayNoList,@RequestParam(value="answerList[]")List<String> answerList,String surveyNo,String empNo){
		
		List<EssayAnswer> list = new ArrayList<EssayAnswer>();
		
		
		for ( int i = 0; i < essayNoList.size(); i++) {
			EssayAnswer ea = new EssayAnswer();
			ea.setEmpNo(empNo);
			ea.setEssayNo(essayNoList.get(i));
			ea.setEssayAnswer(answerList.get(i));
		
			list.add(ea);
		}
		
		System.out.println(list.get(0).getEmpNo());
		System.out.println(list.get(0).getEssayAnswer());
		System.out.println(list.get(0).getEssayAnswerNo());
		System.out.println(list.get(0).getEssayNo());
		System.out.println(list.get(0).getEmpNo());
		
		
		int result = surveyService.insertAnswerList(list);
		 
		return "survey/managerSurveyListForm";
	}
	
	
	
	
	
	
	
	
}
