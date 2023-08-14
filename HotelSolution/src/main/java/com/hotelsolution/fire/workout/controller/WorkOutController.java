package com.hotelsolution.fire.workout.controller;

import java.sql.Timestamp;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
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

@RequiredArgsConstructor
@RequestMapping("workout")
@Slf4j
@Controller
public class WorkOutController {
	
	private final WorkoutService service;

	//근태관리 화면
	@GetMapping("attendance")
	public void attendance(HttpServletRequest req , Model model) {
		HttpSession session = req.getSession();
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		model.addAttribute("loginMember" , loginMember);
		 Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

        // Timestamp를 LocalDateTime으로 변환
        LocalDateTime currentLocalDateTime = currentTimestamp.toLocalDateTime();

        // LocalDateTime을 LocalDate로 변환하여 시간 부분을 제거
        LocalDate currentDate = currentLocalDateTime.toLocalDate();

        // 7일 전의 날짜 계산
        LocalDate sevenDaysAgoDate = currentDate.minusDays(6);

        // 7일 전의 날짜를 LocalDateTime으로 변환하고 시간 부분을 00:00으로 설정
        LocalDateTime sevenDaysAgoLocalDateTime = sevenDaysAgoDate.atStartOfDay();

        // LocalDateTime을 다시 Timestamp로 변환
        Timestamp sevenDaysAgoTimestamp = Timestamp.valueOf(sevenDaysAgoLocalDateTime);
		Map<String,Object> map = new HashMap<>();
		map.put("currentTimestamp", currentTimestamp);
		map.put("sevenDaysAgoTimestamp", sevenDaysAgoTimestamp);
		map.put("no", loginMember.getNo());
		List<WorkoutVo> voList = service.getWorkOutVoListByWeek(map);
		System.out.println(voList);
		 // List<String> 타입의 리스트 생성
        List<String> workMinuteList = new ArrayList<>();
        List<String> workStartTimeList = new ArrayList<>();
        List<String> workEndTimeList = new ArrayList<>();
        List<String> workStartDayList = new ArrayList<>();
        List<String> workEndDayList = new ArrayList<>();
        
        for (int i = 0; i <= 6; i++) {
        	workMinuteList.add("0");
        	workStartDayList.add("0");
        	workEndDayList.add("0");
        	workStartTimeList.add("0");
        	workEndTimeList.add("0");
	      }
        // 요일과 숫자를 매칭하는 HashMap
        Map<String, Integer> dayToIndexMap = new HashMap<>();
        dayToIndexMap.put("SUNDAY", 0);
        dayToIndexMap.put("MONDAY", 1);
        dayToIndexMap.put("TUESDAY", 2);
        dayToIndexMap.put("WEDNESDAY", 3);
        dayToIndexMap.put("THURSDAY", 4);
        dayToIndexMap.put("FRIDAY", 5);
        dayToIndexMap.put("SATURDAY", 6);
        String dayOfWeekString = currentDate.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH).toUpperCase();
        Integer todayindex = dayToIndexMap.get(dayOfWeekString);
        for (WorkoutVo vo : voList) {
            String day = vo.getDayOfWeek();
            String h = vo.getTotalWorkHours();
            String startTime = vo.getWorkStartTime().substring(11,16);
            String startDay = vo.getWorkStartTime().substring(5,10);
            String endTime = vo.getWorkEndTime().substring(11,16);
            String endDay = vo.getWorkEndTime().substring(5,10);

            // dayToIndexMap에서 해당 요일에 해당하는 인덱스 번호를 가져옴
            Integer index = dayToIndexMap.get(day);
            if (index != null) {
                // tableList에 해당 인덱스 번호에 h 값을 추가
            	workMinuteList.set(index, h);
            	workStartTimeList.set(index,startTime);
            	workStartDayList.set(index,startDay);
            	workEndTimeList.set(index,endTime);
            	workEndDayList.set(index,endDay);
            }
        }
       
      int k = 0;
      for (int i = 0; i <= 6; i++) {
    	  if(i<=todayindex) {
    		  
    		  k+=Integer.parseInt(workMinuteList.get(i));
    	  }
    	  else {
    		  workMinuteList.set(i, "0");
    		  workStartTimeList.set(i, "0");
    		  workStartDayList.set(i, "0");
          	  workEndTimeList.set(i, "0");
          	  workEndDayList.set(i, "0");
    	  }
      }
      int lastMin = 2400 - k;
      
      String lastM = Integer.toString(lastMin);
      String min = Integer.toString(k);
      
      
		model.addAttribute("workMinuteList",workMinuteList);
		model.addAttribute("workStartTimeList",workStartTimeList);
		model.addAttribute("workStartDayList",workStartDayList);
		model.addAttribute("workEndTimeList",workEndTimeList);
		model.addAttribute("workEndDayList",workEndDayList);
		model.addAttribute("min",min);
		model.addAttribute("lastM",lastM);
	}//attendance
	
	//출근시간 기록
	@PostMapping("recordStartTime")
	@ResponseBody
	public String recordStartTime(HttpSession session ) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		Map<String,Object> map = new HashMap<>();
		LocalDate currentDate = LocalDate.now();
	   DayOfWeek currentDayOfWeek = currentDate.getDayOfWeek();
		map.put("no", no);
		map.put("currentTimestamp", currentTimestamp);
		map.put("currentDayOfWeek", currentDayOfWeek);
		log.info("출근한 사원 번호 : {} " , no);
		
		
		int result = service.recordStartTime(map);
		
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
		WorkoutVo wvo = service.getCommuteRecordNo(no);
		String st = wvo.getWorkStartTime();
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		String stH = st.substring(11,13);
		String edH = currentTimestamp.toString().substring(11,13);
		String stM = st.substring(14,16);
		String edM = currentTimestamp.toString().substring(14,16);
		int start = Integer.parseInt(stH)*60+Integer.parseInt(stM);
		int end = Integer.parseInt(edH)*60+Integer.parseInt(edM);
		int total = end - start;
		String tworkM = Integer.toString(total);		
		String workoutNo = wvo.getNo();
		
		Map<String, String> params = new HashMap<>();
		params.put("workoutNo", workoutNo);
		params.put("tworkM", tworkM);
		
		Map<String,Object> map = new HashMap<>();
		map.put("workoutNo", workoutNo);
		map.put("endTime", currentTimestamp);
		map.put("tworkM", tworkM);
		System.out.println("currentTimestamp : "+ currentTimestamp);
		System.out.println("workoutNo : "+ workoutNo);
		
		
		
		int result = service.recordEndTime(map);
		int result2 = service.updateTotalWorkHours(params);
		if(result != 1 && result2 != 1) {
			return "fail";
		}
			return "success";
		
	}
	
}//class