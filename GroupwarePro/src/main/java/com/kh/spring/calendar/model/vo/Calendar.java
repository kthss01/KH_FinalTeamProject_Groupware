package com.kh.spring.calendar.model.vo;

import lombok.Data;

//@NoArgsConstructor
//@AllArgsConstructor
//@Setter
//@Getter
//@ToString
// @Data : @Getter @Setter @RequiredArgsConstructor @ToString @EqualsAndHashCode 한꺼번에 설정 
@Data 
public class Calendar {
	private int calNo; // 캘린더 번호
	private String name; // 이름
	private String color; // 색깔
	private int empNo; // 사원 번호
}