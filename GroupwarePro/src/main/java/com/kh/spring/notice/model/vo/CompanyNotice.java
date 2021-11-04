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
public class CompanyNotice {
	private int nNo;//공지사항번호
	private String nTitle;//공지사항제목
	private int empNo; //공지사항작성자(번호)
	private Date createDate;//작성일
	private String nContent;//공지사항내용
	private int count;//조회수
	//private int replyNo; //댓글번호
	
	

	
//	public CompanyNotice() {
//		
//	}
//
//	public CompanyNotice(int nno, String nTitle, int empNo, Date createDate, String nContent,
//			 int count, int replyNo) {
//		super();
//		this.nno = nno;
//		this.nTitle = nTitle;
//		this.empNo = empNo;
//		this.createDate = createDate;
//		this.nContent = nContent;
//		this.count = count;
//		this.replyNo = replyNo;
//	}

	
	
	
}
