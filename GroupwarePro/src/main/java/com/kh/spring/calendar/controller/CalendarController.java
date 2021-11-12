package com.kh.spring.calendar.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.calendar.model.service.CalendarService;
import com.kh.spring.calendar.model.vo.Calendar;
import com.kh.spring.calendar.model.vo.Event;
import com.kh.spring.hr.model.vo.VRequest;

@Controller
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping("calendar.ca")
	public String main(){
		return "/calendar/calendar";
	}
	
	/************************************************************************************************************************/
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="selectEvtList.ca", produces="application/json; charset=utf-8")
	public String selectEventList(int calNo) {
		
		ArrayList<Event> list = calendarService.selectEventList(calNo); 
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create().toJson(list);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="selectCalList.ca", produces="application/json; charset=utf-8")
	public String selectCalList(int empNo) {
		
		ArrayList<Calendar> list = calendarService.selectCalList(empNo);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	/************************************************************************************************************************/
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="insertEvent.ca", method=RequestMethod.POST)
	public String insertEvent(Event evt) {
//		logger.debug(evt.toString());
		
		int result = 0;
		
//		System.out.println(evt.getStartDate());
//		System.out.println(evt.getEndDate());
		
		if (evt.getCalNo() != 0) {
			result = calendarService.insertEvent(evt);
		}
		
		return String.valueOf(result);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="insertCalendar.ca", method=RequestMethod.POST)
	public String insertCalendar(Calendar cal) {
		
//		logger.debug(cal.toString());
		
		int result = 0;
		
		if (cal.getEmpNo() != 0) {
			result = calendarService.insertCalendar(cal);
		}
		
//		logger.debug(cal.toString());
		
		return String.valueOf(result);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="insertVacation.ca", method=RequestMethod.POST)
	public String insertVacation(VRequest vr) {
		
		int result = 0;
		
		// 휴가 결제 시 휴가 일정 등록 하는 컨트롤러
		
		
		return String.valueOf(result);
	}
	
	/************************************************************************************************************************/
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="updateEvent.ca", method=RequestMethod.PUT)
	public String updateEvent(Event evt) {
		
		int result = 0;
		
//		logger.debug(evt.toString());
		
		if (evt.getEvtNo() != 0) {
			result = calendarService.updateEvent(evt);
		}
		
		return String.valueOf(result);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="updateCalendar.ca", method=RequestMethod.PUT)
	public String updateCalendar(Calendar cal) {
		
		int result = 0;
		
		if (cal.getCalNo() != 0) {
			result = calendarService.updateCalendar(cal);
		}
		
		return String.valueOf(result);
	}
	
	/************************************************************************************************************************/
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="deleteEvent.ca", method=RequestMethod.DELETE)
	public String deleteEvent(int evtNo) {
		
		int result = 0;
		
//		logger.debug(String.valueOf(evtNo));
		
		if (evtNo != 0) {			
			result = calendarService.deleteEvent(evtNo);
		}
		
		return String.valueOf(result);
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="deleteCalendar.ca", method=RequestMethod.DELETE)
	public String deleteCalendar(int calNo) {
		
		int result = 0;
		
		if (calNo != 0) {
			result = calendarService.deleteCalendar(calNo);
		}
		
		return String.valueOf(result);
	}
}