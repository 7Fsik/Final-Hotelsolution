package com.hotelsolution.fire.common.home.controller;

import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.dataroom.service.DataRoomService;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;
import com.hotelsolution.fire.common.schedule.service.ScheduleService;
import com.hotelsolution.fire.common.schedule.vo.ScheduleVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.workout.Service.WorkoutService;
import com.hotelsolution.fire.workout.vo.WorkoutVo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class homeController {

    private final ScheduleService scheduleService; 
    private final WorkoutService workOutService;
    private final DataRoomService dataRoomService;

    @GetMapping("/")
    public String home(Model model, HttpSession session)
    {
    	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
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
		List<WorkoutVo> voList = workOutService.getWorkOutVoListByWeek(map);
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
		
		
		
		
		Map<String,Object> map2 = new HashMap();
		map2.put("memberNo",loginMember.getNo());
		map2.put("categoryNo" , "100");
		List<DataRoomVo> dataVoList = dataRoomService.getDataRoomListMain(map2); 
		model.addAttribute("dataVoList" , dataVoList);
        return "common/home";
    }


}
