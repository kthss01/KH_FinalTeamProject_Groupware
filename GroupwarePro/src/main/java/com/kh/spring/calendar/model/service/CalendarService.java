package com.kh.spring.calendar.model.service;

import java.util.ArrayList;

import com.kh.spring.calendar.model.vo.Attendant;
import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;

public interface CalendarService {

	ArrayList<Event> selectEventList();

	ArrayList<Attendant> selectAttList(int evtNo);

	ArrayList<Calendar> selectMyCalList(int empNo);

	int selectAttCount();
	
	int insertEvent(Event evt, int calNo);

	int insertCalendar(Calendar cal);
	
}
