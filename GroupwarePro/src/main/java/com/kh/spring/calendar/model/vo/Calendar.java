package com.kh.spring.calendar.model.vo;

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
public class Calendar {
	private int calNo; // 캘린더 번호
	private String name; // 이름
	private String color; // 색깔
	private int empNo; // 사원 번호
}