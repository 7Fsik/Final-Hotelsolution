package com.hotelsolution.fire.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.schedule.vo.ScheduleVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("schedule")
@Slf4j
public class ScheduleController {
	
	@GetMapping()
	public String calender(){
		return "schedule/calender";
	}
	
	@GetMapping("create")
	public void create() {}
	
	@PostMapping("create")
	public String create(ScheduleVo vo) {
		
		return "redirect:/schedule/calender" ;
		
	}
}
