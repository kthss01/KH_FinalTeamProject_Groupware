package com.kh.spring.example;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.spring.example.ControllerExampleTest.ContextConfig;
import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.service.MemberServiceImpl;
import com.kh.spring.member.model.vo.Member;

/*
 * Service 테스트 예제
 * 
 */

@ExtendWith(SpringExtension.class)
//@ContextConfiguration()
// 해당 컨트롤러에서 사용되는 bean들 추가해줘야함, xml로 되어있던거 class로 만들었으니 그것도 추가 (ContextConfig)
@ContextConfiguration(classes = { MemberServiceImpl.class, MemberDao.class, ContextConfig.class })
public class ControllerExampleTest {
	
	// Session DI 하기 위한 Configuration 클래스위에 annotation 형태가 아니고 xml로 되어있어서 따로 추가
	@Configuration
//	@Import({ MemberDao.class })
	@ImportResource(locations = { "/root-context.xml" })
	public static class ContextConfig {
		
		@Inject
		private SqlSessionFactory sqlFactory;
		
		@Bean
		public SqlSession sqlSession() {
			return sqlFactory.openSession();
		}
		
//		@Bean 
//		public MemberDao memberDao() {
//			return new MemberDao();
//		}
	}
	
//	@Autowired
//	MemberDao memberDao;
	
//	@Autowired
//	SqlSession session;
	
	@Autowired
	MemberService service;
	
	@Test
	// assertj 이용해서 하면 좋을듯
	public void 로그인테스트() {
		Member m = new Member();
		m.setLoginId("kth");
		try {
			Member loginUser = service.loginMember(m);
			System.out.println(loginUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		System.out.println("test");
	}
	
}
