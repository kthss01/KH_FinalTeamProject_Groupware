package com.kh.spring.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.chat.model.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("chatPage.ch")
	public String chatPage() {
		return "/chat/app-chat";
	}
	
}
