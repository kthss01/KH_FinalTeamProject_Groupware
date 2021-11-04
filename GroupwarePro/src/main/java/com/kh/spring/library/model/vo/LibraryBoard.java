package com.kh.spring.library.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LibraryBoard {

	private int cno;
	private int lno;
	private String title;
	private String content;
	private String writer;
	private int hit;
	private Date lDate;
	private String status;
	private String originName;
	private String changeName;
}
