package com.hotelsolution.fire.workout.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.workout.Service.WorkoutService;
import com.hotelsolution.fire.workout.vo.WorkoutVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@RequestMapping("workout")
public class WorkOutController {
	
	private final WorkoutService service;

	@GetMapping("attendance")
	public void attendance(HttpServletRequest req , Model model) {
		HttpSession session = req.getSession();
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		model.addAttribute("loginMember" , loginMember);
	}
	
//	@PostMapping("attendance")
//	public String checkWorkStart(WorkoutVo vo , HttpServletRequest req) {
//		
//		HttpSession session = req.getSession();
//		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
//		vo.setUserNo(loginMember.getNo());
//		
//		int result = service.checkWorkStart(vo);
//		
//		if(result != 1) {
//			throw new RuntimeException("출근 기록 실패");
//		}
//		
//		
//	}
	
}//class
