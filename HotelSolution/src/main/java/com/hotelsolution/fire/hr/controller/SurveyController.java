package com.hotelsolution.fire.hr.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.hr.service.SurveyService;
import com.hotelsolution.fire.hr.vo.SurveyAnswerVo;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.hr.vo.SurveyQuestionVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("hr")
@RequiredArgsConstructor
@Slf4j
public class SurveyController {
	
	private final SurveyService service;
	
	//우측 제목 리스트 가져오는 메소드
	public Map<String, Object> titleList (String titleListpage, String searchValue){
		int listCount = service.getSurveyCnt(searchValue);
		if (titleListpage == null || titleListpage.isEmpty()) {
			titleListpage = "1";
		}
		int currentPage = Integer.parseInt(titleListpage);
		int boardLimit = 7;
		int pageLimit = 5;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		int realPage = (pv.getListCount()-1)/boardLimit+1;
		if(realPage<=pv.getPageLimit()) {
			pv.setEndPage(realPage);
		}
		if(realPage<=pv.getEndPage()) {
			pv.setEndPage(realPage);
		}
		
				
		List<SurveyDocVo> titleList =  service.titleList(pv,searchValue);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("titleList",titleList);
		map.put("pv", pv);
		
		
		return map;
		
		
		
	}
	
	//설문조사 설문지작성 페이지
	@GetMapping("survey/create")
	public void createSurvey(Model model,String titleListpage,  String searchValue) {
		//우측 설문 제목 리스트
		Map<String, Object> map = titleList(titleListpage, searchValue);
		model.addAttribute("titleList",map.get("titleList"));
		model.addAttribute("searchValue",searchValue);
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
	public String surveyOneDetail(HttpSession session, Model model, SurveyDocVo sdvo , String titleListpage, String answerListpage, String searchValue){
		//우측 설문 제목 리스트
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		Map<String, Object> map = titleList(titleListpage, searchValue);
		model.addAttribute("titleList",map.get("titleList"));
		model.addAttribute("pv",map.get("pv"));
		//질문 4개 리스트 가져오기
		List<SurveyQuestionVo> list = service.geteQuestionList(sdvo.getNo());
		model.addAttribute("sdvo",sdvo);
		model.addAttribute("list", list);
		model.addAttribute("searchValue", searchValue);
		//질문 답변 페이징
		Map<String, String> map2 = new HashMap();
		map2.put("no", loginMember.getNo());
		map2.put("surveyNo", sdvo.getNo());
		int listCount = service.getAnswerCnt(map2)/4;
		if(answerListpage == null) {
			answerListpage = "1";
		}
		int currentPage = Integer.parseInt(answerListpage);
		
		int boardLimit = 7;
		int pageLimit = 5;
		PageVo answerListPv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		int realPage = (answerListPv.getListCount()-1)/boardLimit+1;
		if(realPage<=answerListPv.getPageLimit()) {
			answerListPv.setEndPage(realPage);
		}
		if(realPage<=answerListPv.getEndPage()) {
			answerListPv.setEndPage(realPage);
		}
		model.addAttribute("answerListPv",answerListPv);
		//질문 답변 질문별로 가져오기
		List<List<SurveyAnswerVo>> answerLists = new ArrayList<>();
		for (SurveyQuestionVo vo : list) {
		    List<SurveyAnswerVo> answerList = service.answerByOneQuestion(vo.getNo(), answerListPv);
		    answerLists.add(answerList);
		}
		model.addAttribute("answerLists", answerLists);
		return "hr/survey/answer-list";
		
		
	}

	// 리스트에서 1인 답변 클릭 후 해당 답변자의 설문지 답변보기
	@GetMapping("survey/detail")
	public void surveySelectQnaList(Model model, SurveyDocVo sdvo , String titleListpage, String answerer, String searchValue)  {
		if (titleListpage == null || titleListpage.isEmpty()) {
			titleListpage = "1";
		}
		//우측 설문 제목 리스트
		Map<String, Object> map = titleList(titleListpage, searchValue);
		model.addAttribute("titleList",map.get("titleList"));
		model.addAttribute("pv",map.get("pv"));
		//질문 4개 리스트 가져오기
		List<SurveyQuestionVo> list = service.geteQuestionList(sdvo.getNo());
		model.addAttribute("sdvo",sdvo);
		//설문지 번호에 맞는 질문 답변 질문별로 가져오기
		List<List<SurveyAnswerVo>> answerLists = new ArrayList<>();
		for (SurveyQuestionVo vo : list) {
		    List<SurveyAnswerVo> answerList = service.answerByOneQuestionByUser(vo.getNo(), answerer);
		    answerLists.add(answerList);
		}
		
		model.addAttribute("searchValue",searchValue);
		model.addAttribute("answerer",answerer);
		model.addAttribute("list", list);
		model.addAttribute("answerLists", answerLists);

		
	}
	
	
	
	//디테일 리스트(detail 에서 목록으로버튼 or answerList 에서 상세보기 클릭시)
	@GetMapping("survey/detailList")
	public String surveySelectQnaTotalList(HttpSession session,Model model, SurveyDocVo sdvo,  String titleListpage, String detailListpage, String searchValue, String answerer) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		Map<String, String> map2 = new HashMap();
		map2.put("no", loginMember.getNo());
		map2.put("surveyNo", sdvo.getNo());
		int listCount = service.getAnswerCnt2(map2)/4;
		if(detailListpage == null) {
			detailListpage = "1";
		}
		int currentPage = Integer.parseInt(detailListpage);
		int boardLimit = 1;
		int pageLimit = 5;
	
		PageVo detailListPv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		int realPage = (detailListPv.getListCount()-1)/boardLimit+1;
		if(realPage<=detailListPv.getPageLimit()) {
			detailListPv.setEndPage(realPage);
		}
		if(realPage<=detailListPv.getEndPage()) {
			detailListPv.setEndPage(realPage);
		}
		model.addAttribute("detailListPv",detailListPv);
		
		
	
		//우측 설문 제목 리스트
		if (titleListpage == null || titleListpage.isEmpty()) {
			titleListpage = "1";
		}
		Map<String, Object> map = titleList(titleListpage, searchValue);
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
		
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("list", list);
		model.addAttribute("answerLists", answerLists);
		
		return "hr/survey/detail-list";
	}
	
	
	//사원들이 설문조사 작성 -- 미완성 알람창에 ( 인터셉터로 창 이동시마다 검색)
	@GetMapping("survey/write")
	public void surveyWrite(HttpSession session,Model model, String titleListpage,  String searchValue, String surveyNo) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		Map<String, String> map2 = new HashMap();
		map2.put("no", loginMember.getNo());
		map2.put("surveyNo", "");
		int memberSurveyCnt = service.getAnswerCnt(map2)/4;
	    int totalSurveyCnt = service.getSurveyCnt("");
	    int listCount = totalSurveyCnt-memberSurveyCnt;
		if (titleListpage == null || titleListpage.isEmpty()) {
			titleListpage = "1";
		}
		int currentPage = Integer.parseInt(titleListpage);
		int boardLimit = 7;
		int pageLimit = 5;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		int realPage = (pv.getListCount()-1)/boardLimit+1;
		if(realPage<=pv.getPageLimit()) {
			pv.setEndPage(realPage);
		}
		if(realPage<=pv.getEndPage()) {
			pv.setEndPage(realPage);
		}
		
	
		List<SurveyDocVo> titleList =  service.newTitleList(pv,searchValue,loginMember.getNo());
		String no = "";
		if(surveyNo !=null) {
			no = surveyNo;
		}
		List<SurveyQuestionVo> questionList = service.getNewQuestionList(loginMember.getNo(),no);
//		Map<String, Object>map = new HashMap<String, Object>();
//		map.put("newFirst", titleList.get(0));
//		map.put("titleList",titleList);
//		map.put("questionList",questionList);
//		map.put("pv", pv);
		model.addAttribute("titleList",titleList);
		model.addAttribute("newFirst",titleList.get(0));
		model.addAttribute("searchValue",searchValue);
		model.addAttribute("pv",pv);
		model.addAttribute("questionList",questionList);
		
	
		
	}
	@PostMapping("survey/write")
	public String surveyWrite(HttpSession session, String[] answer, String title,String[] no) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		List<String> answers = Arrays.asList(answer);
		List<String> nos = Arrays.asList(no);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("nos", nos);
		map.put("answers", answers);
		map.put("loginMember",loginMember);
		map.put("title",title);
		int result = service.write(map);
	    if (result != 1) {
	        throw new RuntimeException();
	    }
	    return "redirect:/";
		//질문 4개 리스트 가져오기
		
		
	}
	@PostMapping("survey/alert")
	@ResponseBody
	public int surveyAlert(HttpSession session) {
	    MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
	    Map<String, String> map2 = new HashMap();
		map2.put("no", loginMember.getNo());
		map2.put("surveyNo", "");
	    int memberSurveyCnt = service.getAnswerCnt(map2)/4;
	    int totalSurveyCnt = service.getSurveyCnt("");
	    int cnt = totalSurveyCnt-memberSurveyCnt;
	    return cnt;
	}
	
}
