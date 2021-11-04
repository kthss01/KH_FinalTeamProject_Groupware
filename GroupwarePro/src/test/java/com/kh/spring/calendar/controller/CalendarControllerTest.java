package com.kh.spring.calendar.controller;

import static org.assertj.core.api.Assertions.assertThat;

import java.sql.Date;
import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.spring.calendar.model.dao.CalendarDao;
import com.kh.spring.calendar.model.service.CalendarService;
import com.kh.spring.calendar.model.service.CalendarServiceImpl;
import com.kh.spring.calendar.model.vo.Attendant;
import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;
import com.kh.spring.example.ControllerExampleTest.ContextConfig;

/*
 * Calendar Controller에 있는 Service 테스트
 * 
 */

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = { CalendarServiceImpl.class, CalendarDao.class, ContextConfig.class })
public class CalendarControllerTest {
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarControllerTest.class);

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
	CalendarService service;
	
	/*
	 ****************************************************
	 * 조회 (Read)
	 */
	
	@Test
	public void 이벤트리스트조회() {
		
		
		ArrayList<Event> list = service.selectEventList();
		
		for (Event event : list) {
			logger.debug(event.toString());
		}
	}
	
	@Test
	public void 참석자리스트조회() {
		int evtNo = 2;
		
		ArrayList<Attendant> list = service.selectAttList(evtNo);
		
		for (Attendant att : list) {
			logger.debug(att.toString());
		}
	}
	
	@Test
	public void 내관심사리스트조회() {
		int empNo = 201;
		
		ArrayList<Calendar> list = service.selectMyCalList(empNo);
		
		for (Calendar cal : list) {
			logger.debug(cal.toString());
		}
	}

	/*
	 ****************************************************
	 * 등록 (Create)
	 */
	
	@Test
	public void 이벤트등록() {
		// Given		
		// 이벤트
		String name = "테스트이벤트3";
		Date startDate = Date.valueOf("2021-11-14");
		Date endDate = Date.valueOf("2021-11-21");
		String location = "테스트장소3";
		String content = "테스트내용3";
		int catNo = 1;
		
		int evtNo = service.selectEventList().size() + 1;
		
		Event evt = new Event();
		evt.setEvtNo(evtNo);
		evt.setName(name);
		evt.setStartDate(startDate);
		evt.setEndDate(endDate);
		evt.setLocation(location);
		evt.setContent(content);
		evt.setCatNo(catNo);
		
		// 참석자
		int attNo = service.selectAttCount() + 1;
		int empNo = 201;
		
		Attendant att = new Attendant(attNo, evtNo, empNo);
		
		evt.setAttendantList(new ArrayList<Attendant>());
		evt.getAttendantList().add(att);
		
		// 캘린더
		int calNo = 1;
		
		// When
		// 이벤트 등록
		int result = service.insertEvent(evt, calNo);
		
		// Then
		assertThat(result).isEqualTo(1); 
		
		// 등록된 이벤트 조회
		ArrayList<Event> list = service.selectEventList();
		Event evt2 = list.get(list.size() - 1); // 가장 마지막 Event
		logger.info(evt.toString());
		logger.info(evt2.toString());
	}
}
