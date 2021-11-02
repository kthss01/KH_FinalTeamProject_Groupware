package com.kh.spring.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class CalendarDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		Member m1 = sqlSession.selectOne("memberMapper.loginMember", m);
		return m1;
	}

}
