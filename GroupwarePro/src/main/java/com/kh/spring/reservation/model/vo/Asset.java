package com.kh.spring.reservation.model.vo;

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
public class Asset {
	private int asNo; // 자산 번호
	private String name; // 이름
	private String color; // 색깔
}