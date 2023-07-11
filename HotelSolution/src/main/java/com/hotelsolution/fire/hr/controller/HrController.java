package com.hotelsolution.fire.hr.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.hr.service.HrService;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("hr")
@RequiredArgsConstructor
@Slf4j
public class HrController {
	
	private final HrService hrs;
	private List<SurveyDocVo> voList;
	//설문조사 설문지작성 페이지
	@GetMapping("survey/write")
	public String writeSurvey(Model model) {
		voList = hrs.titleList();
		System.out.println(voList);
		model.addAttribute("voList",voList);
		System.out.println(model.getAttribute("voList"));
		return "hr/survey/write";
		
	}
	
	//설문지 작성후 데이터는 넘기고 설문지 결과조회 화면
	@PostMapping("survey/write")
	public String writeSurvry(String title, String[] question) {
		List<String> questions = Arrays.asList(question);
	    Map<String, Object> map = new HashMap<>();
	    map.put("title", title);
	    map.put("questions", questions);
	    int result = hrs.write(map);
	    if (result != 1) {
	        throw new RuntimeException();
	    }
	    return "redirect:/hr/survey/list";
		
	}
	
	//설문 결과 조회 목록보기
	@GetMapping("survey/list")
	public String surveyDetail(Model model) {
		List<SurveyDocVo> voList = new ArrayList<>();
		voList = hrs.titleList();
		model.addAttribute("voList",voList);
		return "hr/survey/list";
	}
	
	
}
