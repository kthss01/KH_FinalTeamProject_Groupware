package com.kh.spring.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;


@ControllerAdvice("com.kh.spring")
public class CommonExceptionHandler {

	@ExceptionHandler({ Exception.class })
	public ModelAndView ExceptionHandler(Exception ex, HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		view.setViewName("common/errorPage");
		view.addObject("msg", ex.getMessage());
		
		ex.printStackTrace();

		return view;
	}

}