package com.kh.spring.survey.model.vo;

import java.sql.Date;

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
public class Survey {

	String surveyNo;
	String surveyTitle;
	String surveyContent;
	Date writeDate;
	Date startDate;
	Date finishDate;
	String statement;
	int questionCount;
	
}
