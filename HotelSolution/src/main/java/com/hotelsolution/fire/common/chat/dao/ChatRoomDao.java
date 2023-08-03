package com.hotelsolution.fire.common.chat.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.common.chat.vo.ChatRoomVo;
import com.hotelsolution.fire.common.chat.vo.TeamChatMessageVo;

@Repository
public class ChatRoomDao {


 

    public List<ChatRoomVo> findAllRooms(SqlSessionTemplate sst, String no){
        //채팅방 생성 순서 최근 순으로 반환
    	if(no==null) {
    		no="1";
    	}//로그린 없어서 임시 리터럴
       return sst.selectList("chatRoom.findAllRooms",no );
    }

    public ChatRoomVo findRoomByNo(SqlSessionTemplate sst, String roomId){
    	System.out.println(roomId);
        return sst.selectOne("chatRoom.findRoomByNo",roomId);
    }

   
	public int createChatRoomVo(SqlSessionTemplate sst, Map<String, String> map) {
		return  sst.insert("chatRoom.create",map);
		
	}

	public ChatRoomVo getCreateChatRoomVo(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("chatRoom.getCreateChatRoomVo",map);
	}

	public List<TeamChatMessageVo> getHsChatList(SqlSessionTemplate sst) {
		return sst.selectList("teamChat.getHsChatList");
	}

	public int setHsChatList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.insert("teamChat.setHsChatList",map);
	}

	public List<TeamChatMessageVo> getTeamChatList(SqlSessionTemplate sst, String teamNo) {
		return sst.selectList("teamChat.getTeamChatList",teamNo);
	}
}
