package com.hotelsolution.fire.common.chat.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.hotelsolution.fire.common.chat.service.ChatRoomService;
import com.hotelsolution.fire.common.chat.vo.ChatRoomVo;
import com.hotelsolution.fire.common.chat.vo.MessageVo;
import com.hotelsolution.fire.common.chat.vo.TeamChatMessageVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.member.vo.PositionVo;
import com.hotelsolution.fire.member.vo.TeamVo;

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
    	List<TeamVo> tvo = service.getTvo();
    	 tvo.remove(0);
    	List<PositionVo> pvo = 	service.getPvo();
    	Gson gson = new Gson();
//    	String pvoJson = gson.toJson(pvo);
    	List<ChatRoomVo>voList = service.getChatRoomList(loginMember.getNo());
    	session.setAttribute("voList", voList);
    	model.addAttribute("tvo",tvo);
    	model.addAttribute("pvo",pvo);
    	

    }
    //1:1 채팅방 입장!
    @GetMapping("room")
    public void goRoom(String selectMemberNo,String user1No,Model model,String chatRoomNo, HttpSession session) {
    	MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
    	String user2No = selectMemberNo;
    	 Map<String,String>map = new HashMap<String, String>();
         map.put("user1No", user1No);
         map.put("user2No", selectMemberNo);
         map.put("chatRoomNo", chatRoomNo);
          map.put("loginMemberNo", loginMember.getNo());
         List<MessageVo> voList= service.getMessage(map); 
         int result = updateTime(map);
         model.addAttribute("user1No", user1No);
         model.addAttribute("user2No", selectMemberNo);
         model.addAttribute("chatRoomNo", chatRoomNo);
         model.addAttribute("voList",voList);
    	
    }
    
    @PostMapping("updateTime")
    @ResponseBody
    public int updateTime(@RequestBody Map<String, String> data) {
        String user1No = data.get("user1No");
        String user2No = data.get("user2No");
        String chatRoomNo = data.get("chatRoomNo");
        String loginMemberNo = data.get("loginMemberNo");


        // 이후에 필요한 로직을 추가하고 결과를 반환하는 등의 작업 수행
        int result = service.updateTime(data);

        return result;
    }

    
    @PostMapping("room")
    @ResponseBody
    public String create(Model model,String selectMemberNo, HttpSession session){
    	MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
    	Map<String,String>map = new HashMap<String, String>();
    	map.put("user1No", loginMember.getNo());
    	map.put("user2No", selectMemberNo);
    	System.out.println("roompost map"+map);
    	ChatRoomVo vo = service.getCreateChatRoomVo(map);
    	int result =0;
    	if(vo==null) {
    		result = service.createChatRoomVo(map);
    		vo = service.getCreateChatRoomVo(map);
    		System.out.println(result);
    		System.out.println(vo);
    	} else {
    		
    	}
//    	result = service.updateTime(map);
//    	;
    	Gson gson = new Gson();
    	String a = gson.toJson(vo);
    	return a;
    	
    	
    }
    
    @PostMapping("sendMessage")
    @ResponseBody
    public int sendMessage(HttpSession session, @RequestBody Map<String, Object> jsonData) {
    	
        MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        String senderNo = loginMember.getNo();
        String content = (String) jsonData.get("content");
        String chatRoomNo = jsonData.get("chatRoomNo").toString();
        String x = jsonData.get("senderNo").toString(); // senderN
        int dotIndex = x.indexOf(".");
        String postno = senderNo.substring(0, dotIndex);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM월 dd일 HH시mm분");
        String formattedDate = dateFormat.format(new Date()); // 현재 시간을 원하는 형식으로 변환
        Map<String, String> map = new HashMap<>();
        map.put("enrollDate", formattedDate);
        map.put("senderNo", senderNo);
        map.put("content", content);
        map.put("chatRoomNo", chatRoomNo);
       
        	int result = 0;
        
        if(postno.equals(senderNo)) {
        	result = service.setMessageList(map);
        }
        return result;
    }
    //채팅방 개설

  //전체채팅방 조회
    @GetMapping("hsroom")
    public void getRoom(Model model, HttpSession session ){
    	  MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
    	  List<TeamChatMessageVo> voList = service.getHsChatList();
    	  model.addAttribute("voList",voList);// 전체 채팅방 모든 메세지 조회
    	  
    }
    
    @PostMapping("hsroom")
    @ResponseBody
    public int getRoom(Model model, HttpSession session, @RequestBody Map<String, Object> jsonData) {
        MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        String senderNo = loginMember.getNo();
        String content = (String) jsonData.get("content");
        String x = jsonData.get("senderNo").toString(); // senderNo를 문자열로 가져옴
        int dotIndex = x.indexOf(".");
        String postno = senderNo.substring(0, dotIndex);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM월 dd일 HH시mm분");
        String formattedDate = dateFormat.format(new Date()); // 현재 시간을 원하는 형식으로 변환
        Map<String, String> map = new HashMap<>();
        map.put("enrollDate", formattedDate);
        map.put("senderNo", senderNo);
        map.put("content", content);
       
        map.put("teamChatNo", "0");
        int result = 0;
        
        if(postno.equals(senderNo)) {
        	result = service.setHsChatList(map);
        }
        return result;
    }
    
    @GetMapping("troom")
    public void getTeamRoom(Model model, HttpSession session){
    	  MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");//로그인 사용자 정보
    	  String teamNo = loginMember.getTeamNo();
    	  List<TeamChatMessageVo> tvoList = service.getTeamChatList(teamNo);
    	  model.addAttribute("tvoList",tvoList);// 팀 채팅방 모든 메세지 조회
    }
    
    @PostMapping("troom")
    @ResponseBody
    public int getTeamRoom(Model model, HttpSession session, @RequestBody Map<String, Object> jsonData) {
    	 MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
         String senderNo = loginMember.getNo();
         String content = (String) jsonData.get("content");
         String x = jsonData.get("senderNo").toString(); // senderNo를 문자열로 가져옴
         int dotIndex = x.indexOf(".");
         String postno = senderNo.substring(0, dotIndex);
         
         SimpleDateFormat dateFormat = new SimpleDateFormat("MM월 dd일 HH시mm분");
         String formattedDate = dateFormat.format(new Date()); // 현재 시간을 원하는 형식으로 변환
         Map<String, String> map = new HashMap<>();
         map.put("enrollDate", formattedDate);
         map.put("senderNo", senderNo);
         map.put("content", content);
        map.put("teamChatNo", loginMember.getTeamNo());
        int result = 0;
        
        if(postno.equals(senderNo)) {
        	result = service.setHsChatList(map);
        }
        return result;
    }
  
    
    @PostMapping("searchMember")
    @ResponseBody
    public String searchMember(String teamNo,String positionNo,String searchType, String searchValue) {
    	Map<String,String>map = new HashMap<String, String>();
    	map.put("teamNo", teamNo);
    	map.put("positionNo", positionNo);
    	map.put("searchType", searchType);
    	map.put("searchValue", searchValue);
    	List<MemberVo> memberVoList = service.searchMember(map);
    	Gson gson = new Gson();
    	String voList = gson.toJson(memberVoList);
    	return voList;
    	
    }
    
    //1:1 채팅방 미확인 채팅 수 가져오기
    @PostMapping("checkCnt")
    @ResponseBody
    public List<String> checkCnt(HttpSession session) {
    	 Timestamp currentTimeStamp = new Timestamp(System.currentTimeMillis());
    	 MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
         // Map에 넣기
    	List<ChatRoomVo> voList = (List<ChatRoomVo>) session.getAttribute("voList");
    	List<String> checkCntList = new ArrayList<String>();
    	Map<String,Object> map = new HashMap();
    	 for (ChatRoomVo vo : voList) {
    		 map.put("loginMemberNo",loginMember.getNo());
	    	map.put("currentTimestamp", currentTimeStamp);
	    	map.put("user1No",vo.getUser1No());
	    	map.put("user2No",vo.getUser2No());
	    	map.put("updateTime1",vo.getUpdateTime1());
	    	map.put("updateTime2",vo.getUpdateTime2());
	    	map.put("chatRoomNo",vo.getNo());
	    	
           int cnt = service.checkCnt(map);
           String checkCnt = String.valueOf(cnt);
           checkCntList.add(checkCnt);
       }
    	 return checkCntList;
    }

// 
}