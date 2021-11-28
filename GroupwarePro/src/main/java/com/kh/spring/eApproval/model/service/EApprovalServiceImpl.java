package com.kh.spring.eApproval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.eApproval.model.dao.EApprovalDao;
import com.kh.spring.eApproval.model.vo.EApproval;
import com.kh.spring.eApproval.model.vo.EForm;
import com.kh.spring.member.model.vo.Member;

@Service
public class EApprovalServiceImpl implements EApprovalService {

	@Autowired
	private EApprovalDao eApprovalDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<EApproval> selectApproveList(int empNo) {
		
		ArrayList<EApproval> list = eApprovalDao.selectApproveList(sqlSession, empNo);
		
		return list;
	}

	@Override
	public ArrayList<EApproval> selectDraftList(int empNo) {

		ArrayList<EApproval> list = eApprovalDao.selectDraftList(sqlSession, empNo);
		
		return list;
	}

	@Override
	public ArrayList<EApproval> selectFinishList(int empNo) {
		
		ArrayList<EApproval> list = eApprovalDao.selectFinishList(sqlSession, empNo);
		
		return list;
	}

	@Override
	public EApproval selectEApproval(String eNo) {

		EApproval ea = eApprovalDao.selectEApproval(sqlSession, eNo);
		
		return ea;
	}

	@Override
	public ArrayList<EForm> selectEFList() {
		
		ArrayList<EForm> eFlist = eApprovalDao.selectEFList(sqlSession);
		
		return eFlist;
	}

	@Override
	public ArrayList<Member> selectMemberList() {
		
		ArrayList<Member> mList = eApprovalDao.selectMemberList(sqlSession);
		
		return mList;
	}

	@Override
	public EForm selectEForm(String fNo) {
		
		EForm eForm = eApprovalDao.selectEForm(sqlSession, fNo);
		
		return eForm;
	}

	@Override
	public Member selectDrafter(int drafterId) {

		Member drafter = eApprovalDao.selectDrafter(sqlSession, drafterId);
		
		return drafter;
	}

	@Override
	public Member selectApprover(int approverId) {
		
		Member approver = eApprovalDao.selectApprover(sqlSession, approverId);
		
		return approver;
	}

	@Override
	public void insertEApproval(EApproval ea) {
		
		int result = eApprovalDao.insertEApproval(sqlSession, ea);
		
		if(result < 0) {
			throw new CommException("결재 기안 실패");
		}
		
	}

	@Override
	public void updateEApproval(EApproval ea) {
		
		int result = eApprovalDao.updateEApproval(sqlSession, ea);
		
		if(result < 0) {
			throw new CommException("문서 수정 실패");
		}
	}

	@Override
	public void deleteEApproval(String eNo) {
		
		int result = eApprovalDao.deleteEApproval(sqlSession, eNo);
		
		if(result < 0) {
			throw new CommException("기안 취소 실패");
		}
	}

	@Override
	public void approveEApproval(EApproval ea) {
		
		int result = eApprovalDao.approveEApproval(sqlSession, ea);
		
		if(result < 0) {
			throw new CommException("결재하기 실패");
		}
	}

	@Override
	public ArrayList<EApproval> selectWaitEApprovalList(int empNo) {
		
		ArrayList<EApproval> list = eApprovalDao.selectWaitEApprovalList(sqlSession, empNo);
		
		return list;
	}

	@Override
	public ArrayList<EApproval> selectDraftEApprovalList(int empNo) {
		
		ArrayList<EApproval> list = eApprovalDao.selectDraftEApprovalList(sqlSession, empNo);
		
		return list;
	}

	@Override
	public ArrayList<EApproval> selectApproveEApprovalList(int empNo) {

		ArrayList<EApproval> list = eApprovalDao.selectApproveEApprovalList(sqlSession, empNo);
		
		return list;
	}

	@Override
	public ArrayList<EForm> selectEFormList() {
		
		ArrayList<EForm> list = eApprovalDao.selectEFormList(sqlSession);
		
		return list;
	}

}
