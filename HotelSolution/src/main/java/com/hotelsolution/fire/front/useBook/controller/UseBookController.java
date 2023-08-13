package com.hotelsolution.fire.front.useBook.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useBook.service.UseBookService;
import com.hotelsolution.fire.front.useBook.vo.UseBookVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("front/useBook")
public class UseBookController {
	
	private final UseBookService us;
	
	///////////////////////////////객실 이용 / 예약 관리 
	@GetMapping("list")
	public String useBookList(@RequestParam(defaultValue = "1")int page,Model model,String startDate , String endDate , String searchType) {
		
		//검색하지 않았을때 
		if(startDate == null && endDate == null) {
			LocalDate currentDate = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String formattedDate = currentDate.format(formatter);
			
			startDate = formattedDate;
			
			LocalDate endDateWithOneDayAdded = currentDate.plusDays(1);
			String formattedEndDate = endDateWithOneDayAdded.format(formatter);
			endDate = formattedEndDate;
		}
		
		//페이지 설정
		int listCount = us.getRoomCnt();
		int currentPage = page ;
		int pageLimit = 5 ;
		int boardLimit= 8 ;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		//날별로 예약 정보 
		Map<String ,String> dateMap = new HashMap<>();
		dateMap.put("startDate", startDate);
		dateMap.put("endDate", endDate);
		dateMap.put("searchType", searchType);
		List <UseBookVo> voList = us.getRoomList(pv,dateMap);
		
		//예약 있는 방들
		Map <String,String> paramMap = new HashMap<>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		paramMap.put("searchType", searchType);
		List <UseBookVo> bookList = us.bookCheck(paramMap);
		
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("bookList", bookList);
		model.addAttribute("pv",pv);
		model.addAttribute("voList",voList);
		
		return "front/useBook/list";
	}
	
//	//예약있는 객실 호수 가져오기 
//	@PostMapping("bookCheck")
//	@ResponseBody
//	public List<UseBookVo> bookCheck(@RequestParam Map<String, String> paramMap){
//		
//		List <UseBookVo> bookList = us.bookCheck(paramMap);
//		
//		return bookList;
//	}
	
	
//	//이용/예약 리스트 검색
//	@PostMapping("list")
//	public String useBookList(@RequestParam Map <String,String> paramMap) {
//		
//		return"dd";
//	}
	
	
	
	@GetMapping("detail")
	public String useBookDetail(@RequestParam Map <String,String> paramMap,Model model) {
		
		UseBookVo vo = us.roomInt(paramMap);
		
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("vo", vo);
		
		return "front/useBook/detail";
	}
	
	@PostMapping("detail/book")
	@ResponseBody
	public int book(@RequestParam Map <String,String> paramMap , HttpSession session ) {
		
		int no = 0;
		int result = 0;
		String checkUse = paramMap.get("checkUse");
		
		if(checkUse.equals("1")) {
			//호텔 손님 먼저 입력
			result = us.setGuest(paramMap);
			if(result == 1) {
				no = us.getGuest(paramMap);
			}else {
				return 0;
			}
		}else if(paramMap.get("checkUse")=="2") {
			no = us.getGuest(paramMap);
		}
		
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		paramMap.put("memberNo", loginMember.getNo());
		paramMap.put("guestNo", Integer.toString(no));
		
		//호텔 손님 번호로 예약 완료 
		int result2 = us.useBook(paramMap);
		
		return result2;
	}
	
	
	@PostMapping("detail/use")
	@ResponseBody
	public int use(@RequestParam Map <String,String> paramMap,HttpSession session ) {
		
		int no = 0;
		int result = 0;
		String checkUse = paramMap.get("checkUse");
		
		if(checkUse.equals("1")) {
			//호텔 손님 먼저 입력
			result = us.setGuest(paramMap);
			System.out.println(result);
			if(result == 1) {
				no = us.getGuest(paramMap);
				
			}else {
				throw new RuntimeException("손님 입력실패 ");
			}
		}else if(checkUse.equals("2")) {
			no = us.getGuest(paramMap);
			if(no == 0) {
				return 100;
			}
		}
		
		System.out.println("if->"+no);
		
		
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		paramMap.put("memberNo", loginMember.getNo());
		paramMap.put("guestNo",  Integer.toString(no));
		
		//호텔 손님 번호로 예약리스트 인서트
		int result2 = us.useBook(paramMap);
		int roomUseNo = 0;
		if(result2==1) {
			//방금 입력한값 가져오기 
			roomUseNo = us.getBookListNo(paramMap);
		}else {
			return 0 ;
		}
		
		Map <String,String> lastMap = new HashMap<>();
		lastMap.put("roomUseNo",  Integer.toString(roomUseNo));
		lastMap.put("totalPrice", paramMap.get("totalPrice"));
		
		
		int lastResult = us.setRoomUse(lastMap);
		
		
		return lastResult;
	}
	//////////////////////////////////////

}
