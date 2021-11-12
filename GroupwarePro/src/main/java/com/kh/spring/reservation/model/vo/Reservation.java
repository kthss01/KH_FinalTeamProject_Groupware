package com.kh.spring.reservation.model.vo;

import java.sql.Date;

import lombok.Data;

//@NoArgsConstructor
//@AllArgsConstructor
//@Setter
//@Getter
//@ToString
@Data
public class Reservation {
	private int rezNo; // 예약 번호
	private String name; // 캘린더명
	private Date startDate; // 시작일 sql.Date
	private Date endDate; // 종료일 sql.Date
	private String allDay; // 종일 여부 default 0 , 1
	private int asNo; // 자산 번호
	private int empNo; // 사원 번호
	private int evtNo; // 이벤트 번호
}