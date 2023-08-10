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
import com.hotelsolution.fire.common.chat.vo.MessageVo;
import com.hotelsolution.fire.common.chat.vo.TeamChatMessageVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.member.vo.PositionVo;
import com.hotelsolution.fire.member.vo.TeamVo;

@Repository
public class ChatRoomDao {


 

    public List<ChatRoomVo> findAllRooms(SqlSessionTemplate sst, String no){
       
       return sst.selectList("chatRoom.findAllRooms",no );
    }

    public ChatRoomVo findRoomByNo(SqlSessionTemplate sst, String roomId){
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

	public List<TeamVo> getTvo(SqlSessionTemplate sst) {
		
		return sst.selectList("teamChat.getTvo");
	}

	public List<PositionVo> getPvo(SqlSessionTemplate sst) {
		// TODO Auto-generated method stub
		return sst.selectList("teamChat.getPvo");
	}

	public List<MemberVo> searchMember(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("teamChat.searchMember",map);
	}

	public List<MessageVo> getMessage(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("message.getMessage",map);
	}

	public int updateTime(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("chatRoom.updateTime",map);
	}

	public int setMessageList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.insert("message.setMessageList", map);
	}

	public List<ChatRoomVo> getChatRoomList(SqlSessionTemplate sst, String no) {
		return sst.selectList("chatRoom.getChatRoomList",no);
	}

	public int checkCnt(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.selectOne("message.checkCnt",map);
	}
}
