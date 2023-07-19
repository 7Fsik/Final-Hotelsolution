	package com.hotelsolution.fire.hr.controller;
	
	import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.hr.service.EmployeeManagementService;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.member.vo.MemberVo;
	
	import lombok.RequiredArgsConstructor;
	import lombok.extern.slf4j.Slf4j;
	
	@Controller
	@RequiredArgsConstructor
	@Slf4j
	@RequestMapping("hr/em")
	public class EmployeeManagementController {
		
		private final EmployeeManagementService service;
		
		
		//직원 관리 페이지
		@GetMapping("list")
		public void list(Model model, String memberListpage) {
			//등록 직원 리스트 조회
			int listCount = service.getMemberCnt();
			if (memberListpage == null || memberListpage.isEmpty()) {
				memberListpage = "1";
			}
			int currentPage = Integer.parseInt(memberListpage);
			int pageLimit = 5;
			int boardLimit = 7;
			
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			
			List<MemberVo> memberVoList = service.getMemberList();
			model.addAttribute("memberVoList", memberVoList);
			model.addAttribute("memberListpage",memberListpage);
			model.addAttribute("pv", pv);
			
			
		}
		
		//
		@GetMapping("new")
		@ResponseBody
		public List getNewList() {
			
			List<MemberVo> newMemberList = service.getNewList();
			return newMemberList;
		}
	
	}
