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
	private String filePath;
	
	public EForm() {
		super();
	}

	public EForm(String fNo, String fName, int creatorId, String creatorName, Date createDate, String filePath) {
		super();
		this.fNo = fNo;
		this.fName = fName;
		this.creatorId = creatorId;
		this.creatorName = creatorName;
		this.createDate = createDate;
		this.filePath = filePath;
	}
	
}
