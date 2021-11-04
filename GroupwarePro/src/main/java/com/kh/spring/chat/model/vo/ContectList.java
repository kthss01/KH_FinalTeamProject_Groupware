package com.kh.spring.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ContectList {
	
	int eNo;
	String loginId;
	String eStatus;
	String eName;
	String phone;
	String email;
	String deptTitle;
	String jobName;

}
