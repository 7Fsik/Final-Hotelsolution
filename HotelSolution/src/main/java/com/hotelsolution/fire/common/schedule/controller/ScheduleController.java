package com.hotelsolution.fire.common.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.common.schedule.service.ScheduleService;
import com.hotelsolution.fire.common.schedule.vo.ScheduleVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.google.gson.Gson;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("schedule")
@Slf4j
@RequiredArgsConstructor
public class ScheduleController {
	
	private final ScheduleService service;
	
	
	@GetMapping("calendar")
	public void calendar(Model model,HttpSession session){
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		List<ScheduleVo> myList;
		myList= service.getMySchedule(loginMember.getNo());
		List<ScheduleVo> teamList;
		teamList= service.getTeamSchedule(loginMember);
		model.addAttribute("myList",myList);
		model.addAttribute("teamList",teamList);
	}
	
	@PostMapping("calendar")
	public String calendar (Model model,HttpSession session, @RequestParam("params") String params) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String[] data = new String[3];
		Gson gson = new Gson();
		String[] paramsArr = gson.fromJson(params, String[].class);
		String startDate = Integer.toString(Integer.parseInt(paramsArr[2].substring(0, 10).replaceAll("-", ""))) ;
		String endDate =Integer.toString(Integer.parseInt(paramsArr[3].substring(0, 10).replaceAll("-", "")));
		data[0] = startDate;
		data[1] = endDate;
		data[2] = paramsArr[1];
		int result = 0;
		System.out.println("1");
		if(paramsArr[0].equals("write")) {
			model.addAttribute("startDate",startDate);
			model.addAttribute("endDate",endDate);
			model.addAttribute("title",data[2]);
			return "schedule/create";
		} else if(paramsArr[0].equals("modify")) {
			result = service.modifySchedule(loginMember, data);
		} else if(paramsArr[0].equals("delete")) {
			System.out.println("4");
			result = service.deleteSchedule(loginMember, data);
		}

		if (result != 1) {
			throw new RuntimeException("일정에서 자연스러운 에러");
		}
		return "redirect:/schedule/calendar" ;
	}
	
	@GetMapping("create")
	public void createSchedule(Model model) {
		
	}
	
	@PostMapping("create")
	public String createSchedule(ScheduleVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		int result = service.createSchedule(loginMember, vo);	
		if(result!=1) {
			throw new RuntimeException();
		}
		return "redirect:/schedule/calendar" ;
	}
	
	@PostMapping("calendar/detail")
	@ResponseBody
	public ScheduleVo detailSchedule(Model model,@RequestParam("params") String params) {
		String[] data = new String[3];
		Gson gson = new Gson();
		String[] paramsArr = gson.fromJson(params, String[].class);
		String startDate = Integer.toString(Integer.parseInt(paramsArr[2].substring(0, 10).replaceAll("-", ""))) ;
		String endDate =Integer.toString(Integer.parseInt(paramsArr[3].substring(0, 10).replaceAll("-", "")));
		data[0] = startDate;
		data[1] = endDate;
		data[2] = paramsArr[1];
		Map<String,String> map = new HashMap<String, String>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("title", data[2]);
		ScheduleVo vo = service.detailSchedule(map);
	
		endDate = Integer.toString((Integer.parseInt(endDate))-1);

		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		return vo;
//		result = service.createSchedule(loginMember, data);		
	}
	
	
}
		


