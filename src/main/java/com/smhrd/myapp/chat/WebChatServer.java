package com.smhrd.myapp.chat;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.myapp.model.Log;
import com.smhrd.myapp.model.MavenMember;



@ServerEndpoint(value = "/chat/{chatId}", configurator = WebSocketFilter.WebSocketConfigurator.class)
public class WebChatServer extends HttpServlet {
	// 유저정보와 채팅방 정보로를 담아줄 해쉬맵 객체 생성
	private static Map<Session,String> users = Collections.synchronizedMap(new HashMap<Session, String>());
	private static Map<Session, String> sessionChatIdMap = Collections.synchronizedMap(new HashMap<>());
	
	// 클라이언트가 웹 소켓 서버에 연결될 때 호출
	@OnOpen
	public void onOpen(Session session, @PathParam("chatId") String chatId) throws IOException{

		HttpSession httpSession = (HttpSession) session.getUserProperties().get("httpSession");
		MavenMember member = (MavenMember) httpSession.getAttribute("member");
		String userId = member.getU_id();
		// 유저아이디와 채팅방아이디를 생생해둔 해쉬맵 객체에 담아줌
		users.put(session, userId);
		sessionChatIdMap.put(session, chatId);
	}
	
	// 클라이언트로부터 메시지를 수신할떄 호출
	@OnMessage
	public void onMsg(String message, Session session) throws IOException{
		String userName = users.get(session);
		String chatId = sessionChatIdMap.get(session);
		
		Map<String, Object> data = new HashMap<>();
	    data.put("chatId", chatId);
	    data.put("message", message);
	    
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonMessage = objectMapper.writeValueAsString(data);
		
	    // 받는사람이 내가아니고 같은 채팅방 아이디일때 채팅방 아이디와 메세지를 담아서 보냄
		synchronized (users) {
			for (Session currentSession : users.keySet()) {
	            String sessionChatId = sessionChatIdMap.get(currentSession);
	            if (!currentSession.equals(session)) {
	            	if (sessionChatId != null && sessionChatId.equals(chatId)) {
	            		currentSession.getBasicRemote().sendText(jsonMessage);
	            	}
	            }
	        }
		}
	}

	// 클라이언트와의 연결이 종료될 때 호출
	@OnClose
	public void onClose(Session session) throws IOException{
		// 해쉬맵 객체에서 유저아이디와 채팅방아이디 삭제
		users.remove(session);
		sessionChatIdMap.remove(session);
	}
}


