package com.kh.spring.manager.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Setter
@Getter
@Data
public class SurveyJson {
	
	String surveyNo;
	String QuestionNo;
	String order;
	String question;
	List<String> option;

	
}
