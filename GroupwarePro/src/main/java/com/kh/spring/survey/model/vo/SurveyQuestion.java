package com.kh.spring.survey.model.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
	
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class SurveyQuestion {

	String questionNo;
	String surveyNo;
	int sequence;
	String required;
	String questionType;
	
	
}
