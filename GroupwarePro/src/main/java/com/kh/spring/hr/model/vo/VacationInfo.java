package com.kh.spring.hr.model.vo;

import lombok.Data;

@Data
public class VacationInfo {
	
	private int empNo;
	private int allDays;
	private int usedDays;
	private int leftDays;
	
	public VacationInfo() {
		super();
	}
	
	public VacationInfo(int empNo, int allDays, int usedDays, int leftDays) {
		super();
		this.empNo = empNo;
		this.allDays = allDays;
		this.usedDays = usedDays;
		this.leftDays = leftDays;
	}
	
	
}
