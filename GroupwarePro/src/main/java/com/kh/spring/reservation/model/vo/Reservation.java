package com.kh.spring.reservation.model.vo;

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
public class Reservation {
	private int rezNo; // 예약 번호
	private String name; // 캘린더명
	private Date startDate; // 시작일 sql.Date
	private Date endDate; // 종료일 sql.Date
	private int asNo; // 자산 번호
	private int empNo; // 사원 번호
	private int evtNo; // 이벤트 번호
}