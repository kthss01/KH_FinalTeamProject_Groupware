package com.kh.spring.calendar.controller;

import java.util.ArrayList;

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

import com.kh.spring.calendar.model.dao.CalendarDao;
import com.kh.spring.calendar.model.service.CalendarService;
import com.kh.spring.calendar.model.service.CalendarServiceImpl;
import com.kh.spring.calendar.model.vo.Event;
import com.kh.spring.example.ControllerExampleTest.ContextConfig;

/*
 * Calendar Service 테스트
 * 
 */

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = { CalendarServiceImpl.class, CalendarDao.class, ContextConfig.class })
public class CalendarControllerTest {

	// Session DI 하기 위한 Configuration 클래스위에 annotation 형태가 아니고 xml로 되어있어서 따로 추가
	@Configuration
	@ImportResource(locations = { "/root-context.xml" })
	public static class ContextConfig {
		
		@Inject
		private SqlSessionFactory sqlFactory;
		
		@Bean
		public SqlSession sqlSession() {
			return sqlFactory.openSession();
		}
		
	}
	
	@Autowired
	CalendarService service;
	
	@Test
	public void 이벤트리스트조회() {
		ArrayList<Event> list = service.selectEventList();
		
		for (Event event : list) {
			System.out.println(event);
		}
	}
}
