package com.kh.spring.community.model.vo;

import java.sql.Date;

import com.kh.spring.common.Attachment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CommunityAttachment {

	private int fno;
	private int bno;
	private String  originName;
	private String changeName;
	private Date uploadDate;
}
