package com.hotelsolution.fire.common.chat.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.common.chat.dao.ChatRoomDao;
import com.hotelsolution.fire.common.chat.vo.ChatRoomVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ChatRoomService {
	
	private final SqlSessionTemplate sst;
	private final ChatRoomDao dao;
	


	public ChatRoomVo findRoomByNo(String roomId) {
		
		return dao.findRoomByNo(sst,roomId);
	}



	public int createChatRoomVo(Map<String, String> map) {
		
		return dao.createChatRoomVo(sst,map);
	}



	public List<ChatRoomVo> findAllRooms(String no) {
		return dao.findAllRooms(sst, no);
	}



	public ChatRoomVo getCreateChatRoomVo(Map<String, String> map) {
		return dao.getCreateChatRoomVo(sst,map);
	}

}
