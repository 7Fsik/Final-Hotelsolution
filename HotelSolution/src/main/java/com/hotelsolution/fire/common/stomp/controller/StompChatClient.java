package com.hotelsolution.fire.common.stomp.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.hotelsolution.fire.common.chat.vo.MessageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatClient {
    private final SimpMessagingTemplate messagingTemplate;

    @MessageMapping(value = "/chat/enter")
    public void enter(MessageVo chatMessage) {
        System.out.println("연결성공");
        chatMessage.setContent(chatMessage.getSenderNo() + "님이 채팅방에 참여하셨습니다.");
        messagingTemplate.convertAndSend("/sub/chat/room/" + chatMessage.getChatRoomNo(), chatMessage);
    }

    @MessageMapping(value = "/chat/message")
    public void message(MessageVo chatMessage) {
        messagingTemplate.convertAndSend("/sub/chat/room/"+chatMessage.getChatRoomNo(),chatMessage);
    }
}