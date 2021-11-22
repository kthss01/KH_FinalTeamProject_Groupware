package com.kh.spring.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		Member m1 = sqlSession.selectOne("memberMapper.loginMember", m);
		return m1;
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember", userId);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList");
	}

	public Member selectMember(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("memberMapper.selectMember",empNo);
	}

	public int checkMember(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("memberMapper.checkMember",empNo);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Member> sortMemberList(SqlSessionTemplate sqlSession, String value) {
		return (ArrayList)sqlSession.selectList("memberMapper.sortMemberList",value);
	}

	public int checkMemberId(SqlSessionTemplate sqlSession, String loginId) {
		return sqlSession.selectOne("memberMapper.checkMemberId",loginId);
	}

	public String searchLoginId(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("memberMapper.searchLoginId",empNo);
	}

	public int updatePassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePassword",m);
	}

	
	
}
