package com.kh.spring.community.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommunityCategory {

	private int cno;
	private String cname;
	private String discription;
	private String manager;
	private String managerName;
	private String status;
	
}
