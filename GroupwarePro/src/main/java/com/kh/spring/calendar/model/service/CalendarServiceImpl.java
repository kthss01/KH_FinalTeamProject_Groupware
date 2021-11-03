package com.kh.spring.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.calendar.model.dao.CalendarDao;
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

}
