package com.kh.spring.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.calendar.model.vo.Event;

@Repository
public class CalendarDao {

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("calendarMapper.selectEventList");
	}

}
