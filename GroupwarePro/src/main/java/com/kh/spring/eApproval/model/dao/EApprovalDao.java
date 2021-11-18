package com.kh.spring.eApproval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.eApproval.model.vo.EApproval;
import com.kh.spring.eApproval.model.vo.EForm;
import com.kh.spring.member.model.vo.Member;

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

	public ArrayList<EForm> selectEFList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("eApprovalMapper.selectEFList");
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("eApprovalMapper.selectMemberList");
	}

	public EForm selectEForm(SqlSessionTemplate sqlSession, String fNo) {
		
		return sqlSession.selectOne("eApprovalMapper.selectEForm", fNo);
	}

	public Member selectDrafter(SqlSessionTemplate sqlSession, int drafterId) {
		
		return sqlSession.selectOne("eApprovalMapper.selectDrafter", drafterId);
	}

	public Member selectApprover(SqlSessionTemplate sqlSession, int approverId) {
		
		return sqlSession.selectOne("eApprovalMapper.selectApprover", approverId);
	}

	public int insertEApproval(SqlSessionTemplate sqlSession, EApproval ea) {
		
		return sqlSession.insert("eApprovalMapper.insertEApproval", ea);
	}

	public int updateEApproval(SqlSessionTemplate sqlSession, EApproval ea) {
		
		return sqlSession.update("eApprovalMapper.updateEApproval", ea);
	}


}
