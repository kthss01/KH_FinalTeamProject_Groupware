package com.kh.spring.manager.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.service.ManagerService;
import com.kh.spring.member.model.vo.Member;

//@EnableAspectJAutoProxy
//@Transactional(rollbackFor = { Exception.class })
@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	

	@Override
	public void insertMember(Member m) {
		int result = memberDao.insertMember(sqlSession, m);
		
		if (result < 0) {
			throw new CommException("회원가입에 실패했습니다.");
		}
	}



	@Override
	public ArrayList<Member> selectMemberList() {
		ArrayList<Member> list = memberDao.selectMemberList(sqlSession);
		return list;
	}

	@Override
	public void deleteMember() {
		int result = memberDao.deleteMember(sqlSession, userId);
		if (result < 0) {
			throw new CommException("회원 탈퇴 처리 실패");
		}		
	}


}
