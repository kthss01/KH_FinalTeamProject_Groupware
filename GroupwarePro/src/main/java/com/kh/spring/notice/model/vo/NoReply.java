package com.kh.spring.notice.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NoReply {
	private int replyNo;
	private String replyContent;
	private int replyWriter;
	private Date createDate;
	private int refNo;
	private String originName;
	private String changeName;
}
