package com.kh.spring.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.calendar.model.dao.CalendarDao;
import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;
import com.kh.spring.common.exception.CommException;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CalendarDao calendarDao;

	@Override
	public ArrayList<Event> selectEventList(int calNo) {
		return calendarDao.selectEventList(sqlSession, calNo);
	}

	@Override
	public ArrayList<Calendar> selectCalList(int empNo) {
		return calendarDao.selectCalList(sqlSession, empNo);
	}
	
	@Override
	public int selectVrCalendar(int empNo) {
		return calendarDao.selectVrCalendar(sqlSession, empNo);
	}

	@Override
	public int insertEvent(Event evt) {
		int result = calendarDao.insertEvent(sqlSession, evt);

		if (result <= 0) {
			throw new CommException("이벤트 생성 실패");
		}

		return evt.getEvtNo();
	}

	@Override
	public int insertCalendar(Calendar cal) {
		int result = calendarDao.insertCalendar(sqlSession, cal);

		if (result <= 0) {
			throw new CommException("캘린더 생성 실패");
		}

		return cal.getCalNo();
	}

	@Override
	public int updateEvent(Event evt) {
		int result = calendarDao.updateEvent(sqlSession, evt);

		if (result <= 0) {
			throw new CommException("이벤트 수정 실패");
		}

		return evt.getEvtNo();
	}

	@Override
	public int updateCalendar(Calendar cal) {
		int result = calendarDao.updateCalendar(sqlSession, cal);

		if (result <= 0) {
			throw new CommException("캘린더 수정 실패");
		}

		return cal.getCalNo();
	}

	@Override
	public int deleteEvent(int evtNo) {
		int result = calendarDao.deleteEvent(sqlSession, evtNo);

		if (result <= 0) {
			throw new CommException("이벤트 삭제 실패");
		}

		return evtNo;
	}

	@Override
	public int deleteCalendar(int calNo) {
		int result = calendarDao.deleteCalendar(sqlSession, calNo);

		if (result <= 0) {
			throw new CommException("캘린더 삭제 실패");
		}

		return calNo;
	}

}
