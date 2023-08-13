package com.hotelsolution.fire.common.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.common.search.service.SearchMemberService;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("search")
public class SearchMemberController {

	private final SearchMemberService service;
	
	@PostMapping("memberlist")
	@ResponseBody
	public String searchList(Model model,String searchType, String searchValue) {
		Map<String,Object> map = new HashMap();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		//등록 직원 리스트 조회
	
		List<MemberVo> memberVoList = service.getSearchList(map);
		
		Gson gson = new Gson();
    	String list = gson.toJson(memberVoList);
    	return list;
		
	}
}
