package com.hotelsolution.fire.common.websocket.server;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//public class WebsocketServer implements WebSocketHandler {
public class WebsocketServer extends TextWebSocketHandler {
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("afterConnectionEstablished 호출됨 ...");
		session.sendMessage(new TextMessage("환영합니다"));
		System.out.println(session);
		sessionSet.add(session);
		System.out.println(sessionSet);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("afterConnectionClosed 호출됨 ...");
		sessionSet.remove(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("handleTextMessage 호출됨 ...");
		log.info("handleTextMessage 호출됨 ... : {}", message);
		
		MemberVo loginMember = (MemberVo) session.getAttributes().get("loginMember");
		Gson gson = new Gson();
		
		HashMap<String, String> msgVo = new HashMap<String, String>();
		msgVo.put("nick", loginMember.getName());
		msgVo.put("msg", message.getPayload());
		msgVo.put("time", new Date() + "");
		
		System.out.println(msgVo);
		
		String jsonStr = gson.toJson(msgVo);
		
		for (WebSocketSession s : sessionSet) {
			s.sendMessage(new TextMessage(jsonStr));
		}
	}
	

}