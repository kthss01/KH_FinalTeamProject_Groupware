package com.kh.spring.eApproval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.eApproval.model.dao.EApprovalDao;
import com.kh.spring.eApproval.model.vo.EApproval;

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

}
