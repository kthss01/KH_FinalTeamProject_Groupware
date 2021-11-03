package com.kh.spring.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.calendar.model.dao.CalendarDao;
import com.kh.spring.calendar.model.vo.Attendant;
import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CalendarDao calendarDao;
	
	@Override
	public ArrayList<Event> selectEventList() {
		
		ArrayList<Event> list = calendarDao.selectEventList(sqlSession);
		return list;
	}

	@Override
	public ArrayList<Attendant> selectAttList(int evtNo) {
		ArrayList<Attendant> list = calendarDao.selectAttList(sqlSession, evtNo);
		return list;
	}

	@Override
	public ArrayList<Calendar> selectMyCalList(int empNo) {
		ArrayList<Calendar> list = calendarDao.selectMyCalList(sqlSession, empNo);
		return list;
	}

}
