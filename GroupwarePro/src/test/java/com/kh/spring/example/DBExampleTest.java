package com.kh.spring.example;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.spring.member.model.vo.Member;

/*
 * Mybatis 접속 및 사용 테스트 예제
 */

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "/root-context.xml" } ) // test 쪽에 있는 root-context.xml 쪽들 src 쪽에 있는거랑 다름
// src 쪽에 있는거 쓸 수 있는 방법이 있다는데 에러가 너무 생겨서 일단 복붙한거 쓰기로 함 mapper 가져올 때 에러

public class DBExampleTest {

	@Inject
	private SqlSessionFactory sqlFactory;

	SqlSession session;
	
	@Test
	public void testFactory() {
		System.out.println(sqlFactory);
	}

	@Test
	@Disabled("세션 테스트")
	public void testSession() throws Exception {
		try (SqlSession session = sqlFactory.openSession()) {
			System.out.println(session);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@BeforeEach
	public void openSession() {
		session = sqlFactory.openSession();
	}
	
	@Test
	public void loginMemberTest() {
		Member m = new Member();
		m.setLoginId("kth");
		Member m1 = session.selectOne("memberMapper.loginMember", m);
		System.out.println(m1);
	}
	
	@AfterEach
	public void closeSession() {
		session.close();
	}


}
