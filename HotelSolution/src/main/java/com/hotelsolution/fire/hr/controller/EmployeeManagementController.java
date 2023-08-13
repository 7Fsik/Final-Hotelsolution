	package com.hotelsolution.fire.hr.controller;
	
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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.hr.service.EmployeeManagementService;
import com.hotelsolution.fire.hr.vo.VacationDocVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.workout.Service.WorkoutService;
import com.hotelsolution.fire.workout.vo.WorkoutVo;

import lombok.RequiredArgsConstructor;
	import lombok.extern.slf4j.Slf4j;
	
	@Controller
	@RequiredArgsConstructor
	@Slf4j
	@RequestMapping("hr/em")
	public class EmployeeManagementController {
		
		private final EmployeeManagementService service;
		private final WorkoutService wservice;
		
	
		
		//직원 관리 페이지
		@GetMapping("list")
		public void list(Model model, String memberListpage,String searchType, String searchValue) {
			Map<String,Object> map = new HashMap();
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
			//등록 직원 리스트 조회
			int listCount = service.getMemberCnt(map);
			if (memberListpage == null || memberListpage.isEmpty()) {
				memberListpage = "1";
			}
			
			int currentPage = Integer.parseInt(memberListpage);
			int boardLimit = 10;
			int pageLimit = 5;
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			int realPage = (pv.getListCount()-1)/boardLimit+1;
			if(realPage<=pv.getPageLimit()) {
				pv.setEndPage(realPage);
			}
		
			if(realPage<=pv.getEndPage()) {
				pv.setEndPage(realPage);
			}
			
			map.put("pv", pv);
			List<MemberVo> memberVoList = service.getMemberList(map);
			model.addAttribute("memberVoList", memberVoList);
			model.addAttribute("memberListpage",memberListpage);
			model.addAttribute("pv", pv);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchValue", searchValue);
			
		}
		//승인 이후 직원 목록 변동
		@PostMapping("list")
		@ResponseBody
		public List<MemberVo> list(String memberListpage,String searchType, String searchValue) {
			Map<String,Object> map = new HashMap();
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
			int listCount = service.getMemberCnt(map);
			if (memberListpage == null || memberListpage.isEmpty()) {
				memberListpage = "1";
			}
			
			int currentPage = Integer.parseInt(memberListpage);
			int boardLimit = 10;
			int pageLimit = 5;
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			int realPage = (pv.getListCount()-1)/boardLimit+1;
			if(realPage<=pv.getPageLimit()) {
				pv.setEndPage(realPage);
			}
		
			if(realPage<=pv.getEndPage()) {
				pv.setEndPage(realPage);
			}
			map.put("pv", pv);
			return service.getMemberList(map);
			
		
		}
		
		//
		@GetMapping("new")
		@ResponseBody
		public List<MemberVo> getNewList() {
			int listCount = 10;
			int currentPage = 1;
			int pageLimit = 1;
			int boardLimit = 10;
			
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
			return  service.getNewList(pv);
		}
		
		//신규멤버 승인 포스트 매핑
		@PostMapping("new")
		@ResponseBody
		public List<MemberVo> getNewList(String memberNo) {
			int result = service.acceptNewMember(memberNo);
			if(result ==1) {
				
				return getNewList();
				
			}else {
				throw new RuntimeException();
			}
		}
		
		@GetMapping("getDetail")
		public String detail(Model model, String memberNo, HttpSession session) {
			//휴가목록

			
			List<VacationDocVo> vdvoList = service.getSubmitListToEm(memberNo);
			
			model.addAttribute("vdvoList",vdvoList);
			
			//근태
			MemberVo vo = service.getDetail(memberNo);
			model.addAttribute("vo", vo);
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
			Map<String,Object> map = new HashMap();
			map.put("currentTimestamp", currentTimestamp);
			map.put("sevenDaysAgoTimestamp", sevenDaysAgoTimestamp);
			map.put("no", memberNo);
			List<WorkoutVo> voList = wservice.getWorkOutVoListByWeek(map);
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
	        for (WorkoutVo vo1 : voList) {
	            String day = vo1.getDayOfWeek();
	            String h = vo1.getTotalWorkHours();
	            String startTime = vo1.getWorkStartTime().substring(11,16);
	            String startDay = vo1.getWorkStartTime().substring(5,10);
	            String endTime = vo1.getWorkEndTime().substring(11,16);
	            String endDay = vo1.getWorkEndTime().substring(5,10);

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
		//attendance
		
			return "hr/em/getDetail";
			
		}
	
	
		@PostMapping("edit")
		public String edit(MemberVo vo) {
		    String teamName = vo.getTeamName();
		    String positionName = vo.getPositionName();
		    if ("호텔경영팀".equals(teamName)) {
		        vo.setTeamNo("1");
		    } else if ("프론트팀".equals(teamName)) {
		        vo.setTeamNo("2");
		    } else if ("식음팀".equals(teamName)) {
		        vo.setTeamNo("3");
		    } else if ("인사팀".equals(teamName)) {
		        vo.setTeamNo("4");
		    } else if ("구매팀".equals(teamName)) {
		        vo.setTeamNo("5");
		    }

		    if ("사원".equals(positionName)) {
		        vo.setPositionNo("1");
		    } else if ("슈퍼바이저".equals(positionName)) {
		        vo.setPositionNo("2");
		    } else if ("팀장".equals(positionName)) {
		        vo.setPositionNo("3");
		    } else if ("매니저".equals(positionName)) {
		        vo.setPositionNo("4");
		    }

		    int result = service.edit(vo);

		    if (result == 1) {
		        // memberNo를 flash 속성으로 전달
		    	 return "redirect:/hr/em/getDetail?memberNo="+vo.getNo();
		    }else {
		    	return "";
		    }


		    // "getDetail" 매핑으로 리다이렉트
		   
		}

	
	}
