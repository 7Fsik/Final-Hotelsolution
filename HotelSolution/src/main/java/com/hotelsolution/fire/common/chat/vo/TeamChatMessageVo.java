package com.hotelsolution.fire.common.chat.vo;

import lombok.Data;

@Data
public class TeamChatMessageVo {
	private String no;
	private String senderNo;
	private String teamChatNo;
	private String content;
	private String enrollDate;
	
	///////////
	private String teamChatRoomName;
	private String senderName;
	private String sendTime;
	private String senderTeamName;
	private String senderPositionName;

}
