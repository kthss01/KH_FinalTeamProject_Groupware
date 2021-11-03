package com.kh.spring.hr.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Work {

	private String wNo;
	private int empNo;
	private Date wDate;
	private String startTime;
	private String endTime;
	
	public Work() {
		super();
	}

	public Work(String wNo, int empNo, Date wDate, String startTime, String endTme) {
		super();
		this.wNo = wNo;
		this.empNo = empNo;
		this.wDate = wDate;
		this.startTime = startTime;
		this.endTime = endTme;
	}

	public Work(int empNo, Date wDate, String startTime) {
		super();
		this.empNo = empNo;
		this.wDate = wDate;
		this.startTime = startTime;
	}

	public Work(String wNo, int empNo, Date wDate, String startTime) {
		super();
		this.wNo = wNo;
		this.empNo = empNo;
		this.wDate = wDate;
		this.startTime = startTime;
	}
	
	
}
