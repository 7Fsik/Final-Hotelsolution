package com.hotelsolution.fire.front.status.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.status.service.StatusService;
import com.hotelsolution.fire.front.status.vo.StatusVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("front/status")
public class StatusController {
	
	private final StatusService ss;
	
	
	//////////////////////////객실 상태관리 
	@GetMapping("list")
	public String roomStatusList(int page, String searchType ,String searchValue, Model model) {
		
		int listCount = ss.getRoomCnt();
		int currentPage = page ;
		int pageLimit = 5 ;
		int boardLimit= 8 ;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<StatusVo>svList = ss.list(pv,searchType,searchValue);
		model.addAttribute("pv", pv);
		model.addAttribute("svList", svList);
		
		return "front/status/list";
	}
	@GetMapping("detail")
	public String roomStatusDetail(int no,Model model) {
		
		StatusVo sv = ss.getRoomByNo(no);
		model.addAttribute("sv", sv);
		
		return "front/status/detail";
	}
	//////////////////////////////////////

}
