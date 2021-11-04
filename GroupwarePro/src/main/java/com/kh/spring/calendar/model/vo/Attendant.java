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
public class Attendant {
	private int attNo; // 참석자 번호
	private int evtNo; // 이벤트 번호
	private int empNo; // 사원 번호
}
