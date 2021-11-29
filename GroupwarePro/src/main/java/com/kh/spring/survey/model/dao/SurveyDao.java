package com.kh.spring.survey.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.survey.model.vo.Essay;
import com.kh.spring.survey.model.vo.EssayAnswer;
import com.kh.spring.survey.model.vo.Survey;


@Repository
public class SurveyDao{

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Survey> selectSurveyList(SqlSessionTemplate session) {
		return (ArrayList)session.selectList("surveyMapper.selectSurveyList");
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Survey> selectAbleSurveyList(SqlSessionTemplate session){
		return (ArrayList)session.selectList("surveyMapper.selectAbleSurveyList");
	}

	public Survey selectSurvey(SqlSessionTemplate session, String surveyNo) {
		Survey survey = session.selectOne("surveyMapper.selectSurvey", surveyNo);
		return survey;
	}

	public int insertSurvey(SqlSessionTemplate session, Survey survey) {
		return session.insert("surveyMapper.insertSurvey", survey);
	}

	public int deleteSurvey(SqlSessionTemplate session, String surveyNo) {
		return session.delete("surveyMapper.deleteSurvey",surveyNo);
	}

	public int updateSurvey(SqlSessionTemplate session, Survey survey) {
		return session.update("surveyMapper.updateSurvey",survey);
	}

	public int insertQuestion(SqlSessionTemplate session, Essay essay) {
		return session.insert("surveyMapper.insertQuestion",essay);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Essay> selectQuestionList(SqlSessionTemplate session, String surveyNo) {
		return (ArrayList)session.selectList("surveyMapper.selectQuestionList",surveyNo);
	}

	public int insertQuestionList(SqlSessionTemplate session, List<Essay> list) {
		return session.insert("surveyMapper.insertQuestionList",list);
	}

	public int insertAnswerList(SqlSessionTemplate session, List<EssayAnswer> list) {
		return session.insert("surveyMapper.insertAnswerList",list);
	}


	public int updateSurveyQuestionCount(SqlSessionTemplate session, String surveyNo) {
		return session.update("surveyMapper.updateSurveyQuestionCount",surveyNo);
	}
	
	
	
	
	
	
	
	
}
