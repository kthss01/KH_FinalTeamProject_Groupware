package com.kh.spring.calendar.model.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.spring.calendar.model.dao.CalendarDao;
import com.kh.spring.example.ControllerExampleTest.ContextConfig;

import static org.junit.Assert.*;

/*
 * Calendar Service에 있는 Dao 테스트
 */

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = { CalendarDao.class, ContextConfig.class })
public class CalendarServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(CalendarServiceTest.class);

	// Session DI 하기 위한 Configuration 클래스위에 annotation 형태가 아니고 xml로 되어있어서 따로 추가
	@Configuration
	@ImportResource(locations = { "file:src/main/resources/root-context.xml" })
	public static class ContextConfig {

		@Inject
		private SqlSessionFactory sqlFactory;

		@Bean
		public SqlSession sqlSession() {
			return sqlFactory.openSession();
		}

	}

	@Autowired
	SqlSessionTemplate sqlSession;

	@Autowired
	CalendarDao dao;

	/*
	 ****************************************************
	 * 조회 (Read)
	 */
	
	@Test
	public void 사원_첫번째_캘린더_조회() {
		// given
		int empNo = 201;
				
		// when
		int calNo = dao.selectVrCalendar(sqlSession, empNo);
		
		// then
		assertEquals("캘린더 번호는 2번이여야 한다.", 2, calNo);
	}

	/*
	 ****************************************************
	 * 등록 (Create)
	 */

	/*
	 ****************************************************
	 * 삭제 (Delete)
	 */

	/*
	 ****************************************************
	 * 수정 (Update)
	 */
}
