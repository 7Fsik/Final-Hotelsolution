package com.hotelsolution.fire.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.schedule.service.ScheduleService;
import com.google.gson.Gson;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("schedule")
@Slf4j
@RequiredArgsConstructor
public class ScheduleController {
	
	private final ScheduleService ss;
	
	
	
	@GetMapping("calendar")
	public void calendar(HttpServletRequest req){
		log.info("get1");
//		MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");
		MemberVo loginMember = new MemberVo();
		loginMember.setNo("1");
		loginMember.setTeamNo("1");
		loginMember.setPositionNo("1");
		loginMember.setId("user01");
		loginMember.setPassword("1234");
		loginMember.setEmail("amk119@naver.com");
		req.getSession().setAttribute("loginMember", loginMember);
		log.info("get2");
//		List<ScheduleVo> voList = ss.readSchedule(loginMember);
//		req.setAttribute("voList", voList);
	}
	
	@PostMapping("calendar")
	public String calendar (HttpServletRequest req, @ModelAttribute String params) {
		log.info("post1");
		String[] data = new String[3];
		MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");
		loginMember.setNo("1");
		loginMember.setTeamNo("1");
		loginMember.setPositionNo("1");
		loginMember.setId("user01");
		loginMember.setPassword("1234");
		loginMember.setEmail("amk119@naver.com");
		req.getSession().setAttribute("loginMember", loginMember);
		log.info(loginMember.toString());
		Gson gson = new Gson();
		params = req.getParameter("params");	
		log.info("post2");
		String[] paramsArr = gson.fromJson(params, String[].class);
		log.info(params);
		log.info(paramsArr.toString());
		String startDate = Integer.toString(Integer.parseInt(paramsArr[2].substring(0, 10).replaceAll("-", ""))+1) ;
		String endDate =(paramsArr[3].substring(0, 10).replaceAll("-", "")) ;
		log.info(startDate);
		log.info(endDate);
		data[0] = startDate;
		data[1] = endDate;
		data[2] = paramsArr[1];
		log.info(data[0]);
		log.info(data[1]);
		log.info(data[2]);
	
		
		
		int result = 0;
		
		if(paramsArr[0].equals("write")) {
			log.info("write1");
			result = ss.createSchedule(loginMember, data);	
			log.info("write");
		} else if(paramsArr[0].equals("modify")) {
			log.info("modify1");
			result = ss.modifySchedule(loginMember, data);
			log.info("modify2");
		} else if(paramsArr[0].equals("delete")) {
			result = ss.deleteSchedule(loginMember, data);
		}
		if (result == 0) {
			throw new RuntimeException();
		}
	
		
		return "redirect:/schedule/calender";

	}
	
//	@GetMapping("create")
//	public void create() {}
//	
//	@PostMapping("create")
//	public String create(ScheduleVo vo) {
//		
//		return "redirect:/schedule/calendar" ;
//		
//	}
}
