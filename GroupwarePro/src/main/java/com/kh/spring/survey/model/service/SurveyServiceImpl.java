package com.kh.spring.survey.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.survey.model.dao.SurveyDao;
import com.kh.spring.survey.model.vo.Essay;
import com.kh.spring.survey.model.vo.EssayAnswer;
import com.kh.spring.survey.model.vo.Survey;



@Service
public class SurveyServiceImpl implements SurveyService {

	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private SurveyDao surveyDao;
	
	@Override
	public ArrayList<Survey> selectSurveyList() {
		
		ArrayList<Survey> list = surveyDao.selectSurveyList(session);
		
		return list;
	}

	@Override
	public Survey selectSurvey(String surveyNo){
		
		Survey survey = surveyDao.selectSurvey(session,surveyNo);
		
		
		return survey;
	}

	@Override
	public int insertSurvey(Survey survey) {
		
		int result = surveyDao.insertSurvey(session,survey);
		return result;
	}

	@Override
	public int deleteSurvey(String surveyNo) {
		
		int result = surveyDao.deleteSurvey(session,surveyNo);
		
		return result;
	}

	@Override
	public int updateSurvey(Survey survey) {
		
		int result = surveyDao.updateSurvey(session,survey);
		
		return result;
	}


	@Override
	public ArrayList<Survey> selectAbleSurveyList() {
		
		ArrayList<Survey> list = surveyDao.selectAbleSurveyList(session);
		
		return list;
	}


	@Override
	public int insertQuestion(Essay essay) {
		
		int result = surveyDao.insertQuestion(session,essay);
		
		return result;
	}

	@Override
	public ArrayList<Essay> selectQuestionList(String surveyNo) {	
		
		ArrayList<Essay> list = surveyDao.selectQuestionList(session,surveyNo);
		
		return list;
	}

	@Override
	public int insertQuestionList(List<Essay> list) {
		
		int result = surveyDao.insertQuestionList(session,list);
		
		return result;
	}

	@Override
	public int insertAnswerList(List<EssayAnswer> list) {
		
		int result = surveyDao.insertAnswerList(session,list);
		
		return result;
	}

	@Override
	public int updateSurveyQustionCount(String surveyNo) {
		
		int result = surveyDao.updateSurveyQuestionCount(session,surveyNo);
		
		return result;
	}


	
	
	

}
