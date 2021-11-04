package com.kh.spring.community.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommunityBoard {
	
	private int bno;
	private int cno;
	private String title;
	private String content;
	private String writer;
	private String nickname;
	private String hit;
	private Date cDate;
	private Date mDate;
	private String status;
}
