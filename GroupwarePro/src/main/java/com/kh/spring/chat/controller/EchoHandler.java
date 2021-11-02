package com.kh.spring.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.spring.member.model.vo.Member;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler { //메세지 전송용 핸들러, binary는 이미지 등 파일 전송
    //세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	//클라이언트가 연결되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session);
	}

	//클라이언트가 웹소켓 서버로 메세지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	       
	       System.out.println("handleTextMessage : " + session + " : " + message);
	       
			String loginId;
			Map<String, Object> map;
			map = session.getAttributes();

			loginId = ((Member)map.get("loginUser")).getLoginId();
	       //모든 유저에게 메세지 출력  -> 알림 구현시 사용
	        for(WebSocketSession sess : sessionList){
	            sess.sendMessage(new TextMessage(loginId + " : " + message.getPayload()));
	        }	
	}

	//클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
	}

	
	
}
