package com.kh.spring.calendar.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.calendar.model.dao.CalendarDao;
import com.kh.spring.member.model.vo.Member;

@Service
public class CalendarService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	CalendarDao calendarDao;
	
	public void test() {
		System.out.println("test");
	}
	
	public Member loginMember(Member m) throws Exception {
		
		Member loginUser = calendarDao.loginMember(sqlSession, m);
		if (loginUser == null) {
			throw new Exception("loginUser 확인");
		}
		
		return loginUser;
	}
}
