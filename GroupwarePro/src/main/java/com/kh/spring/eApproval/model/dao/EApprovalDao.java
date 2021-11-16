package com.kh.spring.eApproval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.eApproval.model.vo.EApproval;

@Repository
public class EApprovalDao {

	public ArrayList<EApproval> selectApproveList(SqlSessionTemplate sqlSession, int empNo) {
		
		return (ArrayList)sqlSession.selectList("eApprovalMapper.selectApproveList", empNo);
	}

	public ArrayList<EApproval> selectDraftList(SqlSessionTemplate sqlSession, int empNo) {
		
		return (ArrayList)sqlSession.selectList("eApprovalMapper.selectDraftList", empNo);
	}

	public ArrayList<EApproval> selectFinishList(SqlSessionTemplate sqlSession, int empNo) {
		
		return (ArrayList)sqlSession.selectList("eApprovalMapper.selectFinishList", empNo);
	}

	public EApproval selectEApproval(SqlSessionTemplate sqlSession, String eNo) {
		
		return sqlSession.selectOne("eApprovalMapper.selectEApproval", eNo);
	}


}
