package com.kh.spring.calendar.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class Event {
	private int evtNo; // 이벤트 번호
	private String name; // 이름
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date startDate; // 시작일 sql.Date
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date endDate; // 종료일 sql.Date
	private String allDay; // 종일 여부 default 0 , 1
	private int calNo; // 캘린더 번호
	private int rezNo; // 예약 번호
}