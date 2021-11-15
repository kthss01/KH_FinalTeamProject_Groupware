package com.kh.spring.eApproval.model.service;

import java.util.ArrayList;

import com.kh.spring.eApproval.model.vo.EApproval;

public interface EApprovalService {

	ArrayList<EApproval> selectApproveList(int empNo);

	ArrayList<EApproval> selectDraftList(int empNo);

	ArrayList<EApproval> selectFinishList(int empNo);

}
