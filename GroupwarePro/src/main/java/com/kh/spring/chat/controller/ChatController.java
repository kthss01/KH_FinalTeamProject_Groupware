package com.kh.spring.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import com.kh.spring.chat.model.vo.Favorites;
import com.kh.spring.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("chatPage.ch")
	public ModelAndView chatPage(ModelAndView mv, HttpServletRequest request, @RequestParam(value="eno",required =false, defaultValue="0") int eno) {
		
		ContectList receiver = null;
		Chat chat = new Chat();
		ArrayList<Chat> chatList = null;
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int user = Integer.parseInt(loginUser.getEmpNo());		
		chat.setSender(user);
		chat.setReceiver(eno);
		System.out.println("eno!! : " + eno);
		if(eno != 0) {
			receiver = chatService.selectContectMember(eno);
			chatList = chatService.selectChatList(chat);
		}
		
		System.out.println("채팅목록 : " + chatList);
		
		mv.addObject("chatList",chatList);
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
		
		int result = 0;
		
		if(chat.getReceiver() != 0) {
			result = chatService.insertMessage(chat);
		}

		return String.valueOf(result);
		
	}
	
	@ResponseBody
	@RequestMapping(value="updateStatus.ch",produces="application/json; charset=utf-8")
	public String updateStatus(ContectList con) {
		
		int result = chatService.updateStatus(con);

		
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value="favorites.ch",produces="application/json; charset=utf-8")
	public String selectFavoriteList(int eno) {
		
		ArrayList<Favorites> list = chatService.selectFavoriteList(eno);
		
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("insertFavorites.ch")
	public String insertFavorites(Favorites f) {
		int result = chatService.insertFavorites(f);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("delteFavorites.ch")
	public String delteFavorites(int fno, int eno) {
		
		Favorites f = new Favorites();
		f.setEno(eno);
		f.setFno(fno);
		
		chatService.deleteFavorites(f);
		
		return "redirect:chatPage.ch";
	}
	
	@ResponseBody
	@RequestMapping("checkFavorites.ch")
	public String checkFavorites(Favorites f) {
		
		Favorites resultF = chatService.checkFavorites(f);
		String result = "";

		if(resultF != null) {
			result ="1";
		}else {
			result = "0";
		}
		return result;
	}
	
}
