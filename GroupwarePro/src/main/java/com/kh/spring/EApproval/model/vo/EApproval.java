package com.kh.spring.eApproval.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EApproval {

	private String eNo;
	private int sCode;
	private String sName;
	private String fNo;
	private String fName;
	private String title;
	private String content;
	private int drafterId;
	private String drafterName;
	private Date draftDate;
	private int approverId;
	private String approverName;
	private Date approveDate;
	
	public EApproval() {
		super();
	}
	
	public EApproval(String eNo, int sCode, String sName, String fNo, String title, String content, int drafterId,
			String drafterName, Date draftDate, int approverId, String approverName, Date approveDate) {
		super();
		this.eNo = eNo;
		this.sCode = sCode;
		this.sName = sName;
		this.fNo = fNo;
		this.title = title;
		this.content = content;
		this.drafterId = drafterId;
		this.drafterName = drafterName;
		this.draftDate = draftDate;
		this.approverId = approverId;
		this.approverName = approverName;
		this.approveDate = approveDate;
	}

	public EApproval(String eNo, int sCode, String sName, String fNo, String fName, String title, String content,
			int drafterId, String drafterName, Date draftDate, int approverId, String approverName, Date approveDate) {
		super();
		this.eNo = eNo;
		this.sCode = sCode;
		this.sName = sName;
		this.fNo = fNo;
		this.fName = fName;
		this.title = title;
		this.content = content;
		this.drafterId = drafterId;
		this.drafterName = drafterName;
		this.draftDate = draftDate;
		this.approverId = approverId;
		this.approverName = approverName;
		this.approveDate = approveDate;
	}
	
	
	
}
