package com.kh.spring.popup.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class PopupNotice {
	
	String popNo;
	String title;
	String content;
	Date startDate;
	Date finishDate;
	String statement;
	
	
}
