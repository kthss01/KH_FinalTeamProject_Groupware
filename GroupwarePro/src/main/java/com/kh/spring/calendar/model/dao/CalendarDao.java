package com.kh.spring.calendar.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.calendar.model.vo.Attendant;
import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;

@Repository
public class CalendarDao {

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("calendarMapper.selectEventList");
	}

	public ArrayList<Attendant> selectAttList(SqlSessionTemplate sqlSession, int evtNo) {
		return (ArrayList) sqlSession.selectList("calendarMapper.selectAttList", evtNo);
	}

	public ArrayList<Calendar> selectMyCalList(SqlSessionTemplate sqlSession, int empNo) {
		return (ArrayList) sqlSession.selectList("calendarMapper.selectMyCalList", empNo);
	}

	public int insertEvent(SqlSessionTemplate sqlSession, Event evt) {
		return sqlSession.insert("calendarMapper.insertEvent", evt);
	}

	public int insertAttendant(SqlSessionTemplate sqlSession, Attendant att) {
		return sqlSession.insert("calendarMapper.insertAttendant", att);
	}

	public int insertEvtCalReg(SqlSessionTemplate sqlSession, int calNo, int evtNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("calNo", calNo);
		map.put("evtNo", evtNo);
		return sqlSession.insert("calendarMapper.insertEvtCalReg", map);
	}

	public int selectEvtNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("calendarMapper.selectEvtNo");
	}

	public int selectAttCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("calendarMapper.selectAttCount");
	}

}
