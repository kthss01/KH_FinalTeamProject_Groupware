package com.kh.spring.commnuity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.commnuity.model.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	
	@RequestMapping("general.co")
	public String generalBoardFrom() {
		
		return "/community/communityBoard";
	}
	
	@GetMapping("enrollBoardForm.co")
	public String enrollBoardFrom() {
		return"/community/enrollBoardForm";
	}
}
