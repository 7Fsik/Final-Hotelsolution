package com.hotelsolution.fire.common.chat.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hotelsolution.fire.common.chat.service.ChatRoomService;
import com.hotelsolution.fire.common.chat.vo.ChatRoomVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("chat")
@Slf4j
public class ChatRoomController {
    private final ChatRoomService service;

    //채팅방 목록 조회
    @GetMapping("rooms")
    public void rooms(Model model,  HttpSession session){
    	MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
    	String no = "1";
    	if(loginMember!=null) {
    		
    		no = loginMember.getNo();
    	}
    	
        log.info("# All Chat Rooms");
        
        List<ChatRoomVo> list = service.findAllRooms(no);
        System.out.println(list);
        model.addAttribute("list",list);

    }

    //채팅방 개설
    @PostMapping("room")
    public String create(Model model, String no, HttpSession session, RedirectAttributes rttr){
    	MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        log.info("# Create Chat Room , name: " + loginMember);
        Map<String,String>map = new HashMap<String, String>();
  //      map.put("user1No", loginMember.getNo());
//        map.put("user2No", no);
        if(loginMember==null) {
        	map.put("user1No", "1");//tempdata
        }else {
        	
        	map.put("user1No", loginMember.getNo());//tempdata
        }
        map.put("user2No", no);//tempdata
        
        int result = service.createChatRoomVo(map);
        if(result!=1) {
        	throw new RuntimeException("채팅방 생성 실패");
        }
        ChatRoomVo roomName = service.getCreateChatRoomVo(map);
        roomName.setUser1Name("1번");
        roomName.setUser2Name("2번");
        rttr.addFlashAttribute("roomName", roomName);
        return "redirect:/chat/rooms";
    }

  //채팅방 조회
    @GetMapping("room")
    public void getRoom(String roomNo, Model model){
    	
        log.info("# get Chat Room, roomNo : " + roomNo);
        ChatRoomVo room = service.findRoomByNo(roomNo);
        room.setUser1Name("1번");
        room.setUser2Name("2번");
        System.out.println(room);
        model.addAttribute("room", room);
    }
}