package com.kh.spring.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.spring.chat.model.service.ChatService;
import com.kh.spring.chat.model.vo.Chat;
import com.kh.spring.chat.model.vo.ContectList;
import com.kh.spring.chat.model.vo.Department;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("chatPage.ch")
	public ModelAndView chatPage(ModelAndView mv, @RequestParam(value="eno",required =false, defaultValue="0") int eno) {
		
		ContectList receiver = null;

		if(eno != 0) {
			receiver = chatService.selectContectMember(eno); 
		}
		mv.addObject("receiver", receiver); 
		mv.setViewName("/chat/app-chat");
		return mv;
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
	
	@ResponseBody
	@RequestMapping(value="sendMsg.ch",produces="application/json; charset=utf-8")
	public String insertMessage(Chat chat) {
		
		System.out.println("chat : " + chat);

		int result = chatService.insertMessage(chat);
		
		return String.valueOf(result);
		
	}
	
}
