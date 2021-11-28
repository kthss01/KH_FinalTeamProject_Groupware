package com.kh.spring.survey.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.survey.model.vo.Survey;


@Repository
public class SurveyDao{

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Survey> selectSurveyList(SqlSessionTemplate session,PageInfo pageInfo) {
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
	
	
	
	
	
	
	
	
}
