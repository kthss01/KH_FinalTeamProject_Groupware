package com.kh.spring.calendar.controller;

import static org.assertj.core.api.Assertions.fail;
import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Date;

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
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.calendar.model.dao.CalendarDao;
import com.kh.spring.calendar.model.service.CalendarService;
import com.kh.spring.calendar.model.service.CalendarServiceImpl;
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
	public void 일정_조회() {
		// given 
		int calNo = 15;
		
		// when
		ArrayList<Event> list = service.selectEventList(calNo);
		
		// then
		logger.debug(list.toString());
	}
	
	@Test
	public void 캘린더_조회() {
		// given
		int empNo = 201;
		
		// when
		ArrayList<Calendar> list = service.selectCalList(empNo);
		
		// then
		logger.debug(list.toString());
	}
	
	@Test
	public void 사원번호_캘린더_조회() {
		// given
		int empNo = 201;
		
		// when
		int calNo = service.selectVrCalendar(empNo);
		
		// then
		logger.debug(String.valueOf(calNo));
	}
	
	/*
	 ****************************************************
	 * 등록 (Create)
	 */
	@Test
	@Transactional
	public void 일정_등록() {
		// given
		int calNo = 15;
		Event evt = new Event();
		evt.setCalNo(calNo);
		evt.setName("테스트 일정");
		evt.setStartDate(new Date());
		evt.setEndDate(new Date());
		evt.setAllDay("1"); // true
		evt.setIsHoliday("N"); // false
		
		// when
		int evtNo = service.insertEvent(evt);
		
		// then
		ArrayList<Event> list = service.selectEventList(calNo);
		
		for (Event event : list) {
			if (event.getEvtNo() == evtNo) {
				logger.debug(event.toString());
				return;
			}
		}
		
		fail("등록된 일정 찾지 못함");
	}
	
	@Test
	@Transactional
	public void 캘린더_등록() {
		// given
		int empNo = 200;
		Calendar cal = new Calendar();
		cal.setName("테스트용 캘린더");
		cal.setColor("green");
		cal.setEmpNo(empNo);
		
		// when
		int calNo = service.insertCalendar(cal);
		
		// then
		ArrayList<Calendar> list = service.selectCalList(empNo);
		for (Calendar calendar : list) {
			if (calendar.getCalNo() == calNo) {
				logger.debug(calendar.toString());
				return;
			}
		} 
		
		fail("등록된 캘린더를 찾지 못함");
	}
	
	/*
	 ****************************************************
	 * 삭제 (Delete)
	 */
	@Test
	@Transactional
	public void 캘린더_삭제() {
		// given
		int empNo = 201;
		int calNo = 16;
		
		// when
		int calNo2 = service.deleteCalendar(calNo);
		
		// then
		ArrayList<Calendar> list = service.selectCalList(empNo);
		
		for (Calendar calendar : list) {
			if (calendar.getCalNo() == calNo2) {
				fail("삭제된 캘린더를 조회에서 찾음");
			}
		}
	}
	
	@Test
	@Transactional
	public void 일정_삭제() {
		// given
		int calNo = 15;
		int evtNo = 7;
		
		// when
		int evtNo2 = service.deleteEvent(evtNo);
		
		// then		
		ArrayList<Event> list = service.selectEventList(calNo);
		
		for (Event event : list) {
			if (event.getEvtNo() == evtNo2) {
				fail("삭제된 일정을 조회에서 찾음");
			}
		}
	}


	/*
	 ****************************************************
	 * 수정 (Update)
	 */
	@Test
	@Transactional
	public void 캘린더_수정() {
		// given
		int empNo = 201;
		int calNo = 16;
		Calendar cal = new Calendar();
		cal.setCalNo(calNo);
		cal.setName("수정된 캘린더");
		cal.setColor("yellow");
		
		// when
		int calNo2 = service.updateCalendar(cal);
		
		// then
		ArrayList<Calendar> list = service.selectCalList(empNo);
		for (Calendar calendar : list) {
			if (calendar.getCalNo() == calNo2) {
				logger.debug(calendar.toString());
				return;
			}
		}
		
		fail("조회에서 수정한 캘린더 못찾음");
	}
	
	@Test
	@Transactional
	public void 일정_수정() {
		// given
		int calNo = 15;
		int evtNo = 7;
		Event evt = new Event();
		evt.setEvtNo(evtNo);
		evt.setName("수정된 일정");
		evt.setStartDate(new Date());
		evt.setEndDate(new Date());
		
		int calNo2 = 16;
		evt.setCalNo(calNo2);
		
		// when
		int evtNo2 = service.updateEvent(evt);
		
		// then
		ArrayList<Event> list = service.selectEventList(calNo2);
		for (Event event : list) {
			if (event.getEvtNo() == evtNo2) {
				logger.debug(event.toString());
				return;
			}
		}
		
		fail("조회에서 수정한 일정 못찾음");
	}
}
