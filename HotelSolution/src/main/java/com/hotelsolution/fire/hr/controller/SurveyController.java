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

import com.hotelsolution.fire.hr.service.SurveyService;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("hr")
@RequiredArgsConstructor
@Slf4j
public class SurveyController {
	
	private final SurveyService ss;
	
	
	//설문조사 설문지작성 페이지
	@GetMapping("survey/write")
	public String writeSurvey(Model model) {
		List<SurveyDocVo> voList = new ArrayList<SurveyDocVo>();
		voList = ss.titleList();
		System.out.println(voList);
		model.addAttribute("voList",voList);
		System.out.println(model.getAttribute("voList"));
		return "hr/survey/write";
		
	}
	
	//설문지 작성후 데이터는 넘기고 홈 화면으로
	@PostMapping("survey/write")
	public String writeSurvry(String title, String[] question) {
		List<String> questions = Arrays.asList(question);
	    Map<String, Object> map = new HashMap<>();
	    map.put("title", title);
	    map.put("questions", questions);
	    int result = ss.write(map);
	    if (result != 1) {
	        throw new RuntimeException();
	    }
	    return "redirect:/hr/survey/write";
		
	}
	
	//첫 화면은 가장 최근 배포한 설문지의 답변, 질문 리스트 -> 제목 리스트에서 클릭 후 해당 설문지 답변,질문 목록보기 까지
	@GetMapping("survey/list")
	public String surveyQnAList(Model model, SurveyDocVo vo) {
		if(vo==null) {
			vo = ss.getRecentSurveyQnAList();
		}
		List<SurveyDocVo> voList = new ArrayList<>();
		voList = ss.titleList();
		model.addAttribute("voList",voList);
		model.addAttribute("vo",vo);
		return "hr/survey/list";
	}
	
	
	
}
