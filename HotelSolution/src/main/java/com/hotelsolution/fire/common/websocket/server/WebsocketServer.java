package com.hotelsolution.fire.common.websocket.server;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.hotelsolution.fire.common.chat.controller.ChatRoomController;
import com.hotelsolution.fire.common.chat.service.ChatRoomService;
import com.hotelsolution.fire.common.chat.vo.TeamChatMessageVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
public class WebsocketServer extends TextWebSocketHandler {
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("afterConnectionEstablished 호출됨 ...");
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
		String roomTypeNo = message.getPayload().substring(0,1);
		log.info("handleTextMessage 호출됨 ...");
		log.info("handleTextMessage 호출됨 ... : {}", message);
		
		MemberVo loginMember = (MemberVo) session.getAttributes().get("loginMember");
		
		System.out.println(message);
		TeamChatMessageVo vo = new TeamChatMessageVo();
		vo.setContent(message.getPayload().substring(1));
		vo.setSenderName(loginMember.getName());
		vo.setSenderNo(loginMember.getNo());
		vo.setTeamChatNo(roomTypeNo);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		String formattedDate = dateFormat.format(new Date());
		vo.setSendTime(formattedDate.substring(6,21));
		System.out.println("서버 vo"+vo);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(vo);
		
		for (WebSocketSession s : sessionSet) {
			s.sendMessage(new TextMessage(jsonStr));
		}
	}
	

}