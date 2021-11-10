package com.kh.spring.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.spring.member.model.vo.Member;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler { //메세지 전송용 핸들러, binary는 이미지 등 파일 전송
    //세션 리스트
	List<WebSocketSession> users = new ArrayList<WebSocketSession>();
	Map<String,WebSocketSession> userSessions = new HashMap<>();
	
	//클라이언트가 연결되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		users.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);  //연결 된 사용자의 아이디가 맵에 들어간다./ 로그인이 되어있지 않으면 세션아이디
		
	}

	//클라이언트가 웹소켓 서버로 메세지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	       
	       System.out.println("handleTextMessage : " + session + " : " + message);
	       
			String senderId = getId(session);
			String text = "";
			//protocol : 기능, 발신자 , 수신자 (user2가 user1에게 채팅을 보낸다면    chat,user2,user1 )
			String msg = message.getPayload();
			String func = "";
			String sender = "";
			String receiver = "";
			String receiverNo = "";
			String title = "";
			
			if(!StringUtils.isEmpty(msg)) {
				String[] strArr = message.getPayload().split(",");
				if(strArr != null) {
					
					func = strArr[0];

					switch(func){
					case "chat" :
						 sender = strArr[1];
						 receiver = strArr[2];
						 receiverNo = strArr[3];
						 text = strArr[4];

						break;
					case "reply" :  //프로토콜 : ( 기능, 글 제목, 글 번호,글 작성자 )
						
						title = strArr[1];
						receiverNo = strArr[2];
						receiver = strArr[3];
						
						break;

					}
	
					WebSocketSession receiverSession = userSessions.get(receiver);
					if("chat".contentEquals(func) && receiverSession != null) {   //받는 이가 로그인한 상태라면 
						receiverSession.sendMessage(new TextMessage("<a href='chatPage.ch?eno="+String.valueOf(receiverNo)+"'>새 메세지가 도착했습니다</a>"+"," + text ));
					}
					
					if("reply".contentEquals(func) && receiverSession != null) {
						
						receiverSession.sendMessage(new TextMessage("reply,"+"<a href='detail.co?bno="
						+String.valueOf(receiverNo)+"'>작성하신 글 ["+title+"]에 댓글이 달렸습니다.</a>"));

					}

					
					
				}
				
			}
			
			
			/*
			 * //모든 유저에게 메세지 출력 -> 알림 구현시 사용 
			 * for(WebSocketSession user : users){
			 * user.sendMessage(new TextMessage(loginId + " : " + message.getPayload())); }
			 */
	}
	
	
	private String getId(WebSocketSession session) {
		Map<String,Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("loginUser");
		if(loginUser == null) {
			return session.getId();
		}else {
			return loginUser.getLoginId();
		}
				
		
	}

	//클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
	}

	
	
}
