package com.kh.spring.calendar.model.service;

import java.util.ArrayList;

import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;

public interface CalendarService {

	ArrayList<Event> selectEventList(int calNo);

	ArrayList<Calendar> selectCalList(int empNo);

	int selectVrCalendar(int empNo);

	int insertEvent(Event evt);

	int insertCalendar(Calendar cal);

	int updateEvent(Event evt);

	int updateCalendar(Calendar cal);

	int deleteEvent(int evtNo);

	int deleteCalendar(int calNo);

}