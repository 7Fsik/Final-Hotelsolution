package com.hotelsolution.fire.workout.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.workout.Service.WorkoutService;
import com.hotelsolution.fire.workout.vo.WorkoutVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@RequestMapping("workout")
@Slf4j
public class WorkOutController {
	
	private final WorkoutService service;

	//근태관리 화면
	@GetMapping("attendance")
	public void attendance(HttpServletRequest req , Model model) {
		HttpSession session = req.getSession();
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		model.addAttribute("loginMember" , loginMember);
	}
	
	//출근시간 기록
	@PostMapping("recordStartTime")
	@ResponseBody
	public String recordStartTime(HttpSession session ) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		log.info("출근한 사원 번호 : {} " , no);
		
		
		int result = service.recordStartTime(no);
		
		if(result != 1) {
			return "fail";
		}
		return "success";
	}//startTime
	
	//퇴근시간 기록
	@PostMapping("recordEndTime")
	@ResponseBody
	public String recordEndTime(HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		log.info("퇴근한 사원 번호 : {} " , no);
		int result = service.recordEndTime(no);
		System.out.println("result : " + result);
		if(result != 1) {
			return "fail";
		}
			return "success";
		
	}//endTime
	
	
	
	
	
}//class





