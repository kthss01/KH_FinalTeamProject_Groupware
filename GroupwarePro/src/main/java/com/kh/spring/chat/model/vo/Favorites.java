package com.kh.spring.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Favorites {

	private int eno;
	private int fno;
	private String fName;
	private String status;
	
}
