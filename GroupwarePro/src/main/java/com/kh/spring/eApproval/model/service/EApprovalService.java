package com.kh.spring.eApproval.model.service;

import java.util.ArrayList;

import com.kh.spring.eApproval.model.vo.EApproval;
import com.kh.spring.eApproval.model.vo.EForm;
import com.kh.spring.member.model.vo.Member;

public interface EApprovalService {

	ArrayList<EApproval> selectApproveList(int empNo);

	ArrayList<EApproval> selectDraftList(int empNo);

	ArrayList<EApproval> selectFinishList(int empNo);

	EApproval selectEApproval(String eNo);

	ArrayList<EForm> selectEFList();

	ArrayList<Member> selectMemberList();

	EForm selectEForm(String fNo);

	Member selectDrafter(int drafterId);

	Member selectApprover(int approverId);

	void insertEApproval(EApproval ea);

	void updateEApproval(EApproval ea);

	void deleteEApproval(String eNo);
	
	void approveEApproval(EApproval ea);

	ArrayList<EApproval> selectWaitEApprovalList(int empNo);

	ArrayList<EApproval> selectDraftEApprovalList(int empNo);

	ArrayList<EApproval> selectApproveEApprovalList(int empNo);

	ArrayList<EForm> selectEFormList();

}
