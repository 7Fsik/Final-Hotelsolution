package com.hotelsolution.fire.common.chat.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatHandler extends TextWebSocketHandler {
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	System.out.println("after");
        // 채팅 클라이언트가 접속하면 호출되는 메서드
        // 채팅방에 입장 처리 등을 수행
    }
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 클라이언트로부터 메시지를 수신하면 호출되는 메서드
        // 메시지를 파싱하여 채팅 내용을 처리
        String payload = message.getPayload();
        // 채팅 메시지 처리 로직을 구현
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 채팅 클라이언트가 접속을 종료하면 호출되는 메서드
        // 채팅방에서 퇴장 처리 등을 수행
    }
}