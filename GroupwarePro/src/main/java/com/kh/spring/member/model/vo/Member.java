package com.kh.spring.member.model.vo;

import java.sql.Date;

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
public class Member {
	private String empNo;
	private String empName;
	private String empReg;
	private String phone;
	private String email;
	private String deptCode;
	private String jobCode;
	private String deptTitle;
	private String jobName;
	private String salCode;
	private int salary;
	private double bonus;
	private Date enrollDate;
	private Date retireDate;
	private String statement;
	private String gender;
	private String loginId;
	private String loginPwd;
	private String status;
	
}
