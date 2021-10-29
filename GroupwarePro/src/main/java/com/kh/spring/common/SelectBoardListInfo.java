package com.kh.spring.common;

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
	private String keyword;
	private PageInfo pageInfo;
	
	
	public SelectBoardListInfo(int cno, String keyword) {
		super();
		this.cno = cno;
		this.keyword = keyword;
	}


	public SelectBoardListInfo(int cno, PageInfo pi) {
		super();
		this.cno = cno;
		this.pageInfo = pi;	
	}

}
