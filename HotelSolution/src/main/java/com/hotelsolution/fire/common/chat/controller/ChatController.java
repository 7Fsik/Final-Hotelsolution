package com.hotelsolution.fire.common.chat.controller;

import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.hotelsolution.fire.common.chat.vo.ChatVo;

@Controller
public class ChatController {

	// 채팅 메세지 전달
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public ChatVo broadcasting(ChatVo chat) {
    	chat.setEnrollDate(new Date().toString());
        
        return chat;
    }
    
}
