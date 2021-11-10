package com.kh.spring.hr.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EmpInfo {
	
	private int empNo;			//사번 emp
	private String empName;		//이름 emp
	private String deptTitle;	//소속 department
	private String email;		//이메일 emp
	private String jobName;		//직위 job
	private String position;	//직책 info
	private String exNumber;	//내선번호 info
	private String phone;		//휴대번호 emp
	private String mainNumber;	//대표전화 info
	private Date enrollDate;	//입사일 emp
	private String duty;		//직무 info
	private String occupation;	//직종 info
	private String jobGroup;	//직군 info
	private	String recruitName;	//채용구분 info
	private String empDiv;		//직원구분 info
	private char salCode;		//급여구분 salary
	private String recommender;	//추천자 info
	private char statement;		//상태 emp
	private	String empReg;		//생년월일 emp
	private char gender;		//성별 emp
	private char marriageYn;	//결혼여부 info
	private char disabilityYn;	//장애여부 info
	private char veteranYn;		//보훈여부 info
	private Date retireDate;	//퇴사일 emp
	private String retireReason;//퇴직사유 info
	
	public EmpInfo() {
		super();
	}
	
	public EmpInfo(int empNo, String empName, String deptTitle, String email, String jobName, String position,
			String exNumber, String phone, String mainNumber, Date enrollDate, String duty,
			String occupation, String jobGroup, String recruitName, String empDiv, char salCode, String recommender,
			char statement, String empReg, char gender, char marriageYn, char disabilityYn, char veteranYn,
			Date retireDate, String retireReason) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.deptTitle = deptTitle;
		this.email = email;
		this.jobName = jobName;
		this.position = position;
		this.exNumber = exNumber;
		this.phone = phone;
		this.mainNumber = mainNumber;
		this.enrollDate = enrollDate;
		this.duty = duty;
		this.occupation = occupation;
		this.jobGroup = jobGroup;
		this.recruitName = recruitName;
		this.empDiv = empDiv;
		this.salCode = salCode;
		this.recommender = recommender;
		this.statement = statement;
		this.empReg = empReg;
		this.gender = gender;
		this.marriageYn = marriageYn;
		this.disabilityYn = disabilityYn;
		this.veteranYn = veteranYn;
		this.retireDate = retireDate;
		this.retireReason = retireReason;
	}
	
	
}
