package com.kh.spring.eApproval.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EForm {
	
	private String fNo;
	private String fName;
	private int creatorId;
	private String creatorName;
	private Date createDate;
	private String originName;
	private String changeName;
	
	public EForm() {
		super();
	}

	public EForm(String fNo, String fName, int creatorId, String creatorName, Date createDate, String originName,
			String changeName) {
		super();
		this.fNo = fNo;
		this.fName = fName;
		this.creatorId = creatorId;
		this.creatorName = creatorName;
		this.createDate = createDate;
		this.originName = originName;
		this.changeName = changeName;
	}
	
}
