package com.hotelsolution.fire.hr.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.hr.service.VacationDocService;
import com.hotelsolution.fire.hr.vo.VacationDocVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("hr/vacation")
@RequiredArgsConstructor
public class VacationDocController {
	
	private final VacationDocService service;
	
	
	//휴가 신청 허가 내역 조회
	@GetMapping("vaclist")
	public void getSubmitList(Model model,String submitListpage,String searchType, String searchValue) {
		
		
		Map<String,Object> map = new HashMap();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		//등록 직원 리스트 조회
		int listCount = service.getSubmitListCnt(map);
		if (submitListpage == null || submitListpage.isEmpty()) {
			submitListpage = "1";
		}
		
		int currentPage = Integer.parseInt(submitListpage);
		int boardLimit = 3;
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
		List<VacationDocVo> vdvoList = service.getSubmitList(map);
		
		model.addAttribute("vdvoList",vdvoList);
		model.addAttribute("submitListpage",submitListpage);
		model.addAttribute("pv", pv);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		
		/////휴가 대기 목록 
		List<VacationDocVo> vdvoList2 = service.getNoSubmitList();
		model.addAttribute("vdvoList2",vdvoList2);
		
	}
}
