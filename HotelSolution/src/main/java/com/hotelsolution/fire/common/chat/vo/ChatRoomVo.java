package com.hotelsolution.fire.common.chat.vo;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.Data;

@Data
public class ChatRoomVo {

    private String no;
    private String user1No;
    private String user1Name;
    private String user2No;
    private String user2Name;
    private String updateTime;
    private Set<WebSocketSession> sessions = new HashSet<>();

   
}