package com.hotelsolution.fire.front.useBook.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useBook.service.UseBookService;
import com.hotelsolution.fire.front.useBook.vo.UseBookVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("front/useBook")
@RequiredArgsConstructor
public class UseBookController {
	
	private final UseBookService us;
	
	///////////////////////////////객실 이용 / 예약 관리 
	@GetMapping("list")
	public String useBookList(int page,Model model,String startDate , String endDate) {
		
		
		//검색하지 않았을때 
		if(startDate==null) {
			LocalDate currentDate = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			String formattedDate = currentDate.format(formatter);
			
			startDate = formattedDate;
			endDate = formattedDate;
		}
		
		System.out.println(startDate+endDate);
		
		//우선 에약 있는 룸 번호 가져오기 
		List<Integer>numList = new ArrayList<>();
		numList = us.getBookNo(startDate,endDate);
		
        //예약있는 룸번호
		//페이지 설정
		int listCount = us.getRoomCnt(numList);
		int currentPage = page ;
		int pageLimit = 5 ;
		int boardLimit= 8 ;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		
		//이용가능한 룸 가져오기 (예약있는 룸 제외)
		List<UseBookVo>voList = us.getRoomList(numList,pv);
		
		model.addAttribute("pv",pv);
		model.addAttribute("voList", voList);
		
		return "front/useBook/list";
	}
	
	//이용/예약 리스트 검색
	@PostMapping("list")
	public String useBookList(Date startDate , Date endDate) {
		
        
		
		
		return"dd";
	}
	
	
	
	@GetMapping("detail")
	public String useBookDetail() {
		return "front/useBook/detail";
	}
	//////////////////////////////////////

}
