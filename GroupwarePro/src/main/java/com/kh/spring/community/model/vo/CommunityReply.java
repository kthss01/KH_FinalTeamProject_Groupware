package com.kh.spring.community.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CommunityReply {
	
	private int cno;
	private int bno;
	private String name;
	private int pwd;
	private Date cDate;
	private int pno;
	private String comment;
	
}
