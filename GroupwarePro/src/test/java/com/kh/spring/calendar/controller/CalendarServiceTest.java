package com.kh.spring.calendar.controller;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;

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
import com.kh.spring.calendar.model.vo.Event;
import com.kh.spring.example.ControllerExampleTest.ContextConfig;

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
	
	@Test
	void 이벤트번호조회() {
		ArrayList<Event> list = dao.selectEventList(sqlSession);
		int nextEvtNo = list.size() + 1;
		
		int lastEvtNo = dao.selectEvtNo(sqlSession);
		
		logger.info(String.valueOf(lastEvtNo));
		
		assertThat(lastEvtNo).isEqualTo(nextEvtNo);
	}
	
	@Test
	void 참석자번호조회() {
		int attNo = dao.selectAttNo(sqlSession);
		
		logger.info(String.valueOf(attNo));
	}
	
	@Test
	void 캘린더번호조회() {
		
		int calNo = dao.selectCalNo(sqlSession);
		
		logger.info(String.valueOf(calNo));
	}
}
