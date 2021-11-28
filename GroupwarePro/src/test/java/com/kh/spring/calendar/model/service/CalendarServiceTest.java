package com.kh.spring.calendar.model.service;

import static org.assertj.core.api.Assertions.fail;
import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Date;

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
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.calendar.model.dao.CalendarDao;
import com.kh.spring.calendar.model.vo.Calendar;
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
	
	@Test
	public void 사원_캘린더_조회() {
		// given
		int empNo = 201;
		
		// when
		ArrayList<Calendar> list = dao.selectCalList(sqlSession, empNo);
		
		// then
		logger.debug(list.toString());
		assertEquals("캘린더 갯수는 3개여야 한다.", 3, list.size());
	}
	
	@Test
	public void 사원_일정_조회() {
		// given
		int calNo = 15;
		
		// when
		ArrayList<Event> list = dao.selectEventList(sqlSession, calNo);
		
		// then
		logger.debug(list.toString());
		assertEquals("이벤트 갯수는 3개여야 한다.", 3, list.size());
	}

	/*
	 ****************************************************
	 * 등록 (Create)
	 */
	
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
		dao.insertCalendar(sqlSession, cal);
		
		// then
		ArrayList<Calendar> list = dao.selectCalList(sqlSession, empNo);
		logger.debug(list.toString());
		for (Calendar calendar : list) {
			if (calendar.getName().equals(cal.getName())) {
				assertEquals("이름이 같은 캘린더의 컬러는 같아야 한다", calendar.getColor(), cal.getColor());
				assertEquals("이름이 같은 캘린더의 사원번호는 같아야 한다", calendar.getEmpNo(), cal.getEmpNo());
				return;
			}
		}
		
		fail("등록된 캘린더를 찾지 못함");
	}
	
	@Test
	@Transactional
	public void 일정_등록() {
		// given
		int calNo = 15;
		Event evt = new Event();
		evt.setCalNo(calNo);
		evt.setName("테스트 이벤트");	
		evt.setStartDate(new Date());
		evt.setEndDate(new Date());
		evt.setAllDay("1"); // true
		evt.setIsHoliday("N"); // false
		
		// when
		dao.insertEvent(sqlSession, evt);
		
		// then
		ArrayList<Event> list = dao.selectEventList(sqlSession, calNo);
		for (Event event : list) {
			if (event.getName().equals(evt.getName())) {
				logger.debug(event.toString());
//				logger.debug(String.valueOf(event.getStartDate().compareTo(evt.getStartDate())));
				assertEquals("이름이 같으면 시작일이 같아야 한다.", event.getStartDate().toString(), evt.getStartDate().toString());
				assertEquals("이름이 같으면 종료일이 같아야 한다.", event.getEndDate().toString(), evt.getEndDate().toString());
				assertEquals("이름이 같으면 allDay 값도 같아야 한다.", event.getAllDay(), evt.getAllDay());
				return;
			}
		}
		
		fail("등록된 일정을 찾지 못함");
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
		dao.deleteCalendar(sqlSession, calNo);
		
		// then
		ArrayList<Calendar> list = dao.selectCalList(sqlSession, empNo);
		
		for (Calendar calendar : list) {
			if (calendar.getCalNo() == calNo) {
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
		dao.deleteEvent(sqlSession, evtNo);
		
		// then		
		ArrayList<Event> list = dao.selectEventList(sqlSession, calNo);
		
		for (Event event : list) {
			if (event.getEvtNo() == evtNo) {
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
		dao.updateCalendar(sqlSession, cal);
		
		// then
		ArrayList<Calendar> list = dao.selectCalList(sqlSession, empNo);
		for (Calendar calendar : list) {
			if (calendar.getCalNo() == calNo) {
				logger.debug(calendar.toString());
				assertEquals("캘린더 이름이 변경되어야 한다.", calendar.getName(), cal.getName());
				assertEquals("캘린더 색깔이 변경되어야 한다.", calendar.getColor(), cal.getColor());
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
		dao.updateEvent(sqlSession, evt);
		
		// then
		ArrayList<Event> list = dao.selectEventList(sqlSession, calNo2);
		for (Event event : list) {
			if (event.getEvtNo() == evtNo) {
				logger.debug(event.toString());
				assertEquals("캘린더 번호가 같아야 한다.", event.getCalNo(), evt.getCalNo());
				assertEquals("일정명이 같아야 한다.", event.getName(), evt.getName());
				assertEquals("시작일이 같아야 한다.", event.getStartDate().toString(), evt.getStartDate().toString());
				assertEquals("종료일이 같아야 한다.", event.getEndDate().toString(), evt.getEndDate().toString());
				return;
			}
		}
		
		fail("조회에서 수정한 일정 못찾음");
	}
}
