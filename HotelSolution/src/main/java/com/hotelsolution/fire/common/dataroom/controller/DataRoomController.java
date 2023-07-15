package com.hotelsolution.fire.common.dataroom.controller;

import java.util.List;import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.common.dataroom.service.DataRoomService;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("dataroom")
public class DataRoomController {
	public final DataRoomService service;
	
	//작성하기 클릭시 작성하는 화면
	@GetMapping("write")
	public void write(Model model,HttpServletRequest req) {
		
	    HttpSession session = req.getSession();
	    MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
	    model.addAttribute("loginMember", loginMember);
	    
	}
	
	@PostMapping("write")
	public String write(Model model, DataRoomVo drvo, List<DataRoomFileVo> drfvoList ) {
		int result =  service.write(drvo,drfvoList);
		
		return "redirect:/dataroom/list";
	}
	
	
	//no 는 카테고리로 공용은 0 부서별은 본인 부서번호 개인은100
	@GetMapping("list")
	public void list(Model model,String no) {
		if(no == null) {
			no = "100";
		}
		List<DataRoomVo> dataVoList =service.getDataRoomList(no); 
		model.addAttribute("dataVoList" , dataVoList);
	}
}
