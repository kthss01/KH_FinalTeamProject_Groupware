package com.kh.spring.calendar.model.service;

import java.util.ArrayList;

import com.kh.spring.calendar.model.vo.Event;

public interface CalendarService {

	ArrayList<Event> selectEventList();

}
