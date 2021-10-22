package com.kh.spring.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LibraryController {

	
	@RequestMapping("generalLibrary.li")
	public String generalBoardFrom() {
		
		return "/library/libraryBoard";
	}
	
	@GetMapping("enrollBoardForm.li")
	public String enrollBoardFrom() {
		return"/library/enrollBoardForm";
	}
}
