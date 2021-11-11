package com.kh.spring.reservation.model.vo;

import lombok.Data;

//@NoArgsConstructor
//@AllArgsConstructor
//@Setter
//@Getter
//@ToString
@Data
public class Asset {
	private int asNo; // 자산 번호
	private String name; // 이름
	private String color; // 색깔
	private AssetCategory category; // 자산 목록
}