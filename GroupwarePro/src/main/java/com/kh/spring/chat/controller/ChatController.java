package com.kh.spring.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.chat.model.service.ChatService;
import com.kh.spring.chat.model.vo.ContectList;
import com.kh.spring.chat.model.vo.Department;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("chatPage.ch")
	public String chatPage() {
		return "/chat/app-chat";
	}
	
	@ResponseBody
	@RequestMapping(value= "deptList.ch",produces="application/json; charset=utf-8")
	public String selectDeptList() {
		
		ArrayList<Department> list = chatService.selectDeptList(); 
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value = "contectList.ch",produces="application/json; charset=utf-8")
	public String selectContectList(String title) {
		
		ArrayList<ContectList> list = chatService.selectContectList(title); 
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
}
