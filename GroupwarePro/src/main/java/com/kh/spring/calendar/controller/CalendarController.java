package com.kh.spring.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	
	@RequestMapping("calendar.ca")
	public String main(){
		return "/calendar/calendar";
	}
	
}
