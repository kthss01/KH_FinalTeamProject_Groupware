package com.kh.spring.calendar.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.calendar.model.service.CalendarService;
import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping("calendar.ca")
	public String main(){
		return "/calendar/calendar";
	}
	
	@ResponseBody
	@RequestMapping(value="selectEvtList.ca", produces="application/json; charset=utf-8")
	public String selectEventList() {
		
		ArrayList<Event> list = calendarService.selectEventList(); 
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="selectMyCalList.ca", produces="application/json; charset=utf-8")
	public String selectMyCalList(int empNo) {
		
		ArrayList<Calendar> list = calendarService.selectMyCalList(empNo);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("insertEvent.ca")
	public String insertEvent(Event evt, int calNo) {
		
		int result = calendarService.insertEvent(evt, calNo);
		
		return String.valueOf(result);
	}
}
