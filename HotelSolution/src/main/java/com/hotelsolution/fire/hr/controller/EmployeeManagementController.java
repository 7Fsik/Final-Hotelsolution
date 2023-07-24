	package com.hotelsolution.fire.hr.controller;
	
	import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
			System.out.println("getList직원 "+pv);
			List<MemberVo> memberVoList = service.getMemberList(map);
			model.addAttribute("memberVoList", memberVoList);
			model.addAttribute("memberListpage",memberListpage);
			model.addAttribute("pv", pv);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchValue", searchValue);
			System.out.println(map);
			System.out.println(memberVoList);
			
		}
		//승인 이후 직원 목록 변동
		@PostMapping("list")
		@ResponseBody
		public List list(String memberListpage,String searchType, String searchValue) {
			Map<String,Object> map = new HashMap();
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
			System.out.println(map);
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
			System.out.println("postList직원 "+pv);
			map.put("pv", pv);
			return service.getMemberList(map);
			
		
		}
		
		//
		@GetMapping("new")
		@ResponseBody
		public List getNewList() {
			int listCount = 10;
			int currentPage = 1;
			int pageLimit = 1;
			int boardLimit = 10;
			
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			List<MemberVo> newMemberList = service.getNewList(pv);
			return newMemberList;
		}
		
		//신규멤버 승인 포스트 매핑
		@PostMapping("new")
		@ResponseBody
		public List getNewList(String memberNo) {
			int result = service.acceptNewMember(memberNo);
			if(result ==1) {
				
				return getNewList();
				
			}else {
				throw new RuntimeException();
			}
		}
		
		@GetMapping("getDetail")
		public void detail(Model model, String memberNo) {
			MemberVo vo = service.getDetail(memberNo);
			model.addAttribute("vo", vo);
			
		}
	
	}
