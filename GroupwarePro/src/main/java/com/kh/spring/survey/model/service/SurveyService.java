package com.kh.spring.survey.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.spring.common.PageInfo;
import com.kh.spring.survey.model.vo.Essay;
import com.kh.spring.survey.model.vo.EssayAnswer;
import com.kh.spring.survey.model.vo.Survey;

public interface SurveyService  {

	ArrayList<Survey> selectSurveyList();

	Survey selectSurvey(String surveyNo);

	int insertSurvey(Survey survey);

	int deleteSurvey(String surveyNo);

	int updateSurvey(Survey survey);

	ArrayList<Survey> selectAbleSurveyList();

	int insertQuestion(Essay essay);

	ArrayList<Essay> selectQuestionList(String surveyNo);

	int insertQuestionList(List<Essay> list);

	int insertAnswerList(List<EssayAnswer> list);

	int updateSurveyQustionCount(String surveyNo);



	
	
	
	
}
