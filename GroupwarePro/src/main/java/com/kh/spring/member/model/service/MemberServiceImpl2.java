package com.kh.spring.member.model.service;

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
public class MemberServiceImpl2 {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;


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


}
