package com.kh.spring.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;

@Repository
public class CalendarDao {

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession, int calNo) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectEventList", calNo);
	}

	public ArrayList<Calendar> selectCalList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalList", empNo);
	}

	public int insertEvent(SqlSessionTemplate sqlSession, Event evt) {
		return sqlSession.insert("calendarMapper.insertEvent", evt);
	}

	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.insert("calendarMapper.insertCalendar", cal);
	}

	public int updateEvent(SqlSessionTemplate sqlSession, Event evt) {
		return sqlSession.update("calendarMapper.updateEvent", evt);
	}

	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.update("calendarMapper.updateCalendar", cal);
	}

	public int deleteEvent(SqlSessionTemplate sqlSession, int evtNo) {
		return sqlSession.update("calendarMapper.deleteEvent", evtNo);
	}

	public int deleteCalendar(SqlSessionTemplate sqlSession, int calNo) {
		return sqlSession.update("calendarMapper.deleteCalendar", calNo);
	}



}
