package com.kh.spring.tblMeals.model.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

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
public class TblMealsCal {
	private int calNo;
	private String lnc;
	@JsonFormat(shape = Shape.STRING,pattern = "yyyy-MM-dd")
	private Date startDate;
	@JsonFormat(shape = Shape.STRING,pattern = "yyyy-MM-dd")
	private Date endDate;

	
	
	
//	CAL_NO NUMBER PRIMARY KEY,
//	LNC VARCHAR2(4000),
//	START_DATE DATE ,
//	END_DATE DATE,

}
