package com.kh.spring.hr.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class VOccur {
	
	private String occurNo;
	private int empNo;
	private int vCode;
	private Date occurDate;
	private Date expiryDate;
	private int occurDays;
	private String reason;
	
	public VOccur() {
		super();
	}

	public VOccur(String occurNo, int empNo, int vCode, Date occurDate, Date expiryDate, int occurDays, String reason) {
		super();
		this.occurNo = occurNo;
		this.empNo = empNo;
		this.vCode = vCode;
		this.occurDate = occurDate;
		this.expiryDate = expiryDate;
		this.occurDays = occurDays;
		this.reason = reason;
	}

	public VOccur(Date occurDate, Date expiryDate, int occurDays, String reason) {
		super();
		this.occurDate = occurDate;
		this.expiryDate = expiryDate;
		this.occurDays = occurDays;
		this.reason = reason;
	}
	
	
}
