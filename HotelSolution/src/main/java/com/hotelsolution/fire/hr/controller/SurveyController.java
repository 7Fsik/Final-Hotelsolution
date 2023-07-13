package com.hotelsolution.fire.hr.controller;

import java.lang.ProcessHandle.Info;
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

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.hr.service.SurveyService;
import com.hotelsolution.fire.hr.service.SurveyServiceImpl;
import com.hotelsolution.fire.hr.vo.SurveyAnswerVo;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.hr.vo.SurveyQuestionVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("hr")
@RequiredArgsConstructor
@Slf4j
public class SurveyController {
	
	private final SurveyService service;
	

	public Map<String, Object> titleList (String titleListpage){
		int listCount = service.getSurveyCnt();
		if(titleListpage == null) {
			titleListpage = "1";
		}
		int currentPage = Integer.parseInt(titleListpage);
		
		int pageLimit = 5;
		int boardLimit = 7;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<SurveyDocVo> titleList =  service.titleList(pv);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("titleList",titleList);
		map.put("pv", pv);
		
		
		return map;
		
		
		
	}
	
	//설문조사 설문지작성 페이지
	@GetMapping("survey/write")
	public void writeSurvey(Model model,String titleListpage) {
		
		Map<String, Object> map = titleList(titleListpage);
		model.addAttribute("titleList",map.get("titleList"));
		model.addAttribute("pv",map.get("pv"));
		
	}
	
	//설문지 작성후 데이터는 넘기고 홈 화면으로
	@PostMapping("survey/write")
	public String writeSurvry(String title, String[] question) {
		List<String> questions = Arrays.asList(question);
	    Map<String, Object> map = new HashMap<>();
	    map.put("title", title);
	    map.put("questions", questions);
	    int result = service.write(map);
	    if (result != 1) {
	        throw new RuntimeException();
	    }
	    return "redirect:/hr/survey/write";
		
	}
	

	@GetMapping("survey/answerList")
	public String surveyOneDetail(Model model, SurveyDocVo sdvo , String titleListpage, String answerListpage){
		
		Map<String, Object> map = titleList(titleListpage);
		model.addAttribute("titleList",map.get("titleList"));
		model.addAttribute("pv",map.get("pv"));
		List<SurveyQuestionVo> list = service.geteQuestionList(sdvo.getNo());
		model.addAttribute("sdvo",sdvo);
		model.addAttribute("list", list);
		//질문 페이징
		int listCount = service.getAnswerCnt(sdvo.getNo())/4;
		if(answerListpage == null) {
			answerListpage = "1";
		}
		int currentPage = Integer.parseInt(answerListpage);
		
		int pageLimit = 5;
		int boardLimit = 7;
		PageVo answerListPv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		model.addAttribute("answerListPv",answerListPv);
		//
		List<List<SurveyAnswerVo>> answerLists = new ArrayList<>();
		for (SurveyQuestionVo vo : list) {
		    List<SurveyAnswerVo> answerList = service.answerByOneQuestion(vo.getNo(), answerListPv);
		    System.out.println(answerList);
		    answerLists.add(answerList);
		}
		System.out.println(answerLists);
		model.addAttribute("answerLists", answerLists);
	
		return "hr/survey/answer-list";
		
		
	}
	
//	//첫 화면은 가장 최근 배포한 설문지의 답변, 질문 리스트 -> 제목 리스트에서 클릭 후 해당 설문지 답변,질문 목록보기 까지
//	@GetMapping("survey/home")
//	public String surveyHomeQnAList(Model model, SurveyDocVo vo) {
//		int listCount = service.getSurveyCnt();
//		int currentPage = 1;
//		int pageLimit = 5;
//		int boardLimit = 7;
//		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
//		
//		List<SurveyDocVo> titleList = service.titleList(pv);
//		titleList = service.titleList(pv);//화면 우측에 설문지 제목 리스트
//		
//		vo = service.getRecentSurveyQnAList();
//		
//		model.addAttribute("titleList",titleList);
//		model.addAttribute("vo",vo);
//		return "hr/survey/list";
//	}
//	
//	// 제목 리스트에서 클릭 후 해당 설문지 답변,질문 목록보기 까지
//	@GetMapping("survey/list")
//	public void surveySelectQnaList(Model model, int no) {
//		int listCount = service.getSurveyCnt();
//		int currentPage = 1;
//		int pageLimit = 5;
//		int boardLimit = 7;
//		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
//		List<SurveyDocVo> titleList = service.titleList(pv);	//화면 우측에 설문지 제목 리스트
//		if(no==0) {
//			throw new RuntimeException("그 설문지 없는데?");
//		}
//		vo = service.getRecentSurveyQnAList();
//		
//		model.addAttribute("titleList",titleList);
//		model.addAttribute("vo", vo);
//	}
//	
	
	
	
	
}
