package com.kh.spring.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;

//@EnableAspectJAutoProxy
//@Transactional(rollbackFor = { Exception.class })
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	
	
	@Override
	public Member loginMember(Member m) throws Exception {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		if (loginUser == null) {
			throw new Exception("loginUser 확인");
		}
		
		return loginUser;
	}

	@Override
	public void insertMember(Member m) {
		int result = memberDao.insertMember(sqlSession, m);
		
		if (result < 0) {
			throw new CommException("회원가입에 실패했습니다.");
		}
	}

	@Override
	public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		if (loginUser == null) {
			throw new CommException("아이디가 없음");
		}
		
		if (!bCryptPasswordEncoder.matches(m.getLoginPwd(), loginUser.getLoginPwd())) {
			System.out.println(m.getLoginPwd());
			System.out.println(loginUser.getLoginPwd());
			
			throw new CommException("비밀번호 불일치");
		}
		
		return loginUser;
	}

	@Override
	public Member updateMember(Member m) throws Exception {

		int result = memberDao.updateMember(sqlSession, m);
		
//		memberDao.insertMember(sqlSession, m); // 일부러 에러 발생
		
		if (result > 0) {
			Member loginUser = memberDao.loginMember(sqlSession, m);
			return loginUser;
		} else {
			throw new Exception("회원수정 실패");
//			throw new CommException("회원수정 실패");
		}
		
	}

	@Override
	public void deleteMember(String userId) {
		
		int result = memberDao.deleteMember(sqlSession, userId);
		
		if (result < 0) {
			throw new CommException("회원탈퇴 실패");
		}
		
	}


	@Override
	public ArrayList<Member> selectMemberList() {
		
		ArrayList<Member> list = memberDao.selectMemberList(sqlSession);
		
		return list;
	}

	@Override
	public Member selectMember(String empNo) {
		Member member = memberDao.selectMember(sqlSession,empNo);
		return member;
	}

	@Override
	public int checkMember(String empNo) {
		
		int result = memberDao.checkMember(sqlSession, empNo);
		
		return result;
	}

	@Override
	public ArrayList<Member> sortMemberList(String value) {
			
		ArrayList<Member> result = memberDao.sortMemberList(sqlSession,value);
		
		return result;
	}

	@Override
	public int checkMemberId(String loginId) {
		
		int result = memberDao.checkMemberId(sqlSession, loginId);
		
		return result;
	}

	@Override
	public String searchLoginId(String empNo) {
		String result = memberDao.searchLoginId(sqlSession,empNo);
		return result;
	}

	@Override
	public int updatePassword(Member m) {
		
		int result = memberDao.updatePassword(sqlSession,m);
		
		return result;
	}


	

}
