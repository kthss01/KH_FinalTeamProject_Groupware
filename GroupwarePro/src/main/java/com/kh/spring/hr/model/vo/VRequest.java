package com.kh.spring.hr.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class VRequest {

	private String reqNo;
	private int empNo;
	private int vCode;
	private Date firstDate;
	private Date lastDate;
	private int usingDay;
	private String reason;
	private String vName;
	private String empName;
	private String deptTitle;
	
	public VRequest() {
		super();
	}
	
	public VRequest(String reqNo, int empNo, int vCode, Date firstDate, Date lastDate, int usingDay, String reason) {
		super();
		this.reqNo = reqNo;
		this.empNo = empNo;
		this.vCode = vCode;
		this.firstDate = firstDate;
		this.lastDate = lastDate;
		this.usingDay = usingDay;
		this.reason = reason;
	}

	public VRequest(String reqNo, int empNo, int vCode, Date firstDate, Date lastDate, int usingDay, String reason,
			String vName, String empName, String deptTitle) {
		super();
		this.reqNo = reqNo;
		this.empNo = empNo;
		this.vCode = vCode;
		this.firstDate = firstDate;
		this.lastDate = lastDate;
		this.usingDay = usingDay;
		this.reason = reason;
		this.vName = vName;
		this.empName = empName;
		this.deptTitle = deptTitle;
	}
	

	
}
