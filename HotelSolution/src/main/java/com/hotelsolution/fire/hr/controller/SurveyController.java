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
import org.springframework.web.bind.annotation.RequestParam;

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
	
	//우측 제목 리스트 가져오는 메소드
	public Map<String, Object> titleList (String titleListpage){
		int listCount = service.getSurveyCnt();
		if (titleListpage == null || titleListpage.isEmpty()) {
			titleListpage = "1";
		}
		int currentPage = Integer.parseInt(titleListpage);
		System.out.println(currentPage);
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
	@GetMapping("survey/create")
	public void createSurvey(Model model,String titleListpage) {
		//우측 설문 제목 리스트
		Map<String, Object> map = titleList(titleListpage);
		model.addAttribute("titleList",map.get("titleList"));
		model.addAttribute("pv",map.get("pv"));
		
	}
	
	//설문지 작성후 데이터는 넘기고 홈 화면으로
	@PostMapping("survey/create")
	public String createSurvry(String title, String[] question) {
		List<String> questions = Arrays.asList(question);
	    Map<String, Object> map = new HashMap<>();
	    map.put("title", title);
	    map.put("questions", questions);
	    int result = service.create(map);
	    if (result != 1) {
	        throw new RuntimeException();
	    }
	    return "redirect:/hr/survey/create";
		
	}
	
	//질분 답변 리스트 페이지
	@GetMapping("survey/answerList")
	public String surveyOneDetail(Model model, SurveyDocVo sdvo , String titleListpage, String answerListpage){
		//우측 설문 제목 리스트
		Map<String, Object> map = titleList(titleListpage);
		model.addAttribute("titleList",map.get("titleList"));
		model.addAttribute("pv",map.get("pv"));
		//질문 4개 리스트 가져오기
		List<SurveyQuestionVo> list = service.geteQuestionList(sdvo.getNo());
		model.addAttribute("sdvo",sdvo);
		model.addAttribute("list", list);
		//질문 답변 페이징
		int listCount = service.getAnswerCnt(sdvo.getNo())/4;
		if(answerListpage == null) {
			answerListpage = "1";
		}
		int currentPage = Integer.parseInt(answerListpage);
		
		int pageLimit = 5;
		int boardLimit = 7;
		PageVo answerListPv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		model.addAttribute("answerListPv",answerListPv);
		//질문 답변 질문별로 가져오기
		List<List<SurveyAnswerVo>> answerLists = new ArrayList<>();
		for (SurveyQuestionVo vo : list) {
		    List<SurveyAnswerVo> answerList = service.answerByOneQuestion(vo.getNo(), answerListPv);
		    answerLists.add(answerList);
		}
		model.addAttribute("answerLists", answerLists);
		System.out.println(answerLists);
	
		return "hr/survey/answer-list";
		
		
	}

	// 리스트에서 1인 답변 클릭 후 해당 답변자의 설문지 답변보기
	@GetMapping("survey/detail")
	public void surveySelectQnaList(Model model, SurveyDocVo sdvo , String titleListpage, String answerer) {
		if (titleListpage == null || titleListpage.isEmpty()) {
			titleListpage = "1";
		}
		//우측 설문 제목 리스트
		Map<String, Object> map = titleList(titleListpage);
		model.addAttribute("titleList",map.get("titleList"));
		model.addAttribute("pv",map.get("pv"));
		//질문 4개 리스트 가져오기
		List<SurveyQuestionVo> list = service.geteQuestionList(sdvo.getNo());
		model.addAttribute("sdvo",sdvo);
		//설문지 번호에 맞는 질문 답변 질문별로 가져오기
		List<List<SurveyAnswerVo>> answerLists = new ArrayList<>();
		for (SurveyQuestionVo vo : list) {
		    List<SurveyAnswerVo> answerList = service.answerByOneQuestionByUser(vo.getNo(), answerer);
		    log.info(answerList.toString());
		    answerLists.add(answerList);
		}
		
		model.addAttribute("answerer",answerer);
		model.addAttribute("list", list);
		model.addAttribute("answerLists", answerLists);

		
	}
	
	
	
	//디테일 리스트(detail 에서 목록으로버튼 or answerList 에서 상세보기 클릭시)
	@GetMapping("survey/detailList")
	public String surveySelectQnaTotalList(Model model, SurveyDocVo sdvo,  String titleListpage, String detailListpage) {
		//질문에 있는 모든 설문 답 리스트
		int listCount = service.getAnswerCnt(sdvo.getNo())/4;
		if(detailListpage == null) {
			detailListpage = "1";
		}
		int currentPage = Integer.parseInt(detailListpage);
		
		int pageLimit = 5;
		int boardLimit = 1;
		
		PageVo detailListPv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
	
		model.addAttribute("detailListPv",detailListPv);
		
		
		//우측 설문 제목 리스트
		if (titleListpage == null || titleListpage.isEmpty()) {
			titleListpage = "1";
		}
		Map<String, Object> map = titleList(titleListpage);
		model.addAttribute("titleList",map.get("titleList"));
		model.addAttribute("pv",map.get("pv"));
		//질문 4개 리스트 가져오기
		List<SurveyQuestionVo> list = service.geteQuestionList(sdvo.getNo());
		model.addAttribute("sdvo",sdvo);
		//설문지 번호에 맞는 질문 답변 질문별로 가져오기
		List<List<SurveyAnswerVo>> answerLists = new ArrayList<>();
		for (SurveyQuestionVo vo : list) {
		    List<SurveyAnswerVo> answerList = service.getSurveySelectQnaTotalList(vo.getNo());
		    answerLists.add(answerList);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("answerLists", answerLists);
		
		return "hr/survey/detail-list";
	}
	
	
	//사원들이 설문조사 작성 -- 미완성 알람창에 ( 인터셉터로 창 이동시마다 검색)
	@GetMapping("survey/write")
	public void surveyWrite(Model model, SurveyDocVo sdvo) {
		
		//질문 4개 리스트 가져오기
		List<SurveyQuestionVo> list = service.geteQuestionList(sdvo.getNo());
		model.addAttribute("sdvo",sdvo);
		//설문지 번호에 맞는 질문 답변 질문별로 가져오기
		List<List<SurveyAnswerVo>> answerLists = new ArrayList<>();
		for (SurveyQuestionVo vo : list) {
		    List<SurveyAnswerVo> answerList = service.getSurveySelectQnaTotalList(vo.getNo());
		    answerLists.add(answerList);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("answerLists", answerLists);
		
	}
	
}
