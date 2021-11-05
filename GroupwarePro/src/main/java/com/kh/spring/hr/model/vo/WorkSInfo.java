package com.kh.spring.hr.model.vo;

import lombok.Data;

@Data
public class WorkSInfo {
	
	private String sNo;
	private String wNo;
	private int sCode;
	private String occurTime;
	
	public WorkSInfo() {
		// TODO Auto-generated constructor stub
	}

	public WorkSInfo(String sNo, String wNo, int sCode, String occurTime) {
		super();
		this.sNo = sNo;
		this.wNo = wNo;
		this.sCode = sCode;
		this.occurTime = occurTime;
	}

	public WorkSInfo(String wNo, int sCode) {
		super();
		this.wNo = wNo;
		this.sCode = sCode;
	}
	
}
