package com.hotelsolution.fire.common.home.controller;

import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.schedule.service.ScheduleService;
import com.hotelsolution.fire.common.schedule.vo.ScheduleVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class homeController {

    private final ScheduleService scheduleService; 


    @GetMapping("/")
    public String home(Model model, HttpSession session)
    {
    	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		List<ScheduleVo> myList= scheduleService.getMySchedule(loginMember.getNo());
		List<ScheduleVo> teamList= scheduleService.getTeamSchedule(loginMember);
		model.addAttribute("myList",myList);
		model.addAttribute("teamList",teamList);
    	
        return "common/home";
    }


}
