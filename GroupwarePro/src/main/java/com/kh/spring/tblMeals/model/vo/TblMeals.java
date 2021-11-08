package com.kh.spring.tblMeals.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TblMeals {
	private int tblNo;
	private Date tblDate;
	private int categoryNo;
	private String lnc;
	private String dnr;
	
	
//	M_NO NUMBER PRIMARY KEY,
//	M_DATE DATE,
//	CATEGORY_NO NUMBER REFERENCES M_CATEGORY(CATEGORY_NO),
//	LNC VARCHAR2(4000),
//	DNR VARCHAR2(4000) 
}
