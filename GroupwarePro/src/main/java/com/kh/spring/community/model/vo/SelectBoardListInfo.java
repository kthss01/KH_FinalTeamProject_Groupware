package com.kh.spring.community.model.vo;

import com.kh.spring.common.PageInfo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SelectBoardListInfo {
	
	private int cno;
	private PageInfo pageInfo;

}
