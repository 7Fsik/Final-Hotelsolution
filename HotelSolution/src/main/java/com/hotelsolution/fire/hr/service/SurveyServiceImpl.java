package com.hotelsolution.fire.hr.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.hr.dao.SurveyDao;
import com.hotelsolution.fire.hr.dao.SurveyDaoImpl;
import com.hotelsolution.fire.hr.vo.SurveyAnswerVo;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.hr.vo.SurveyQuestionVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class SurveyServiceImpl implements SurveyService {
	
	private final SurveyDao dao;
	private final SqlSessionTemplate sst;
	@Override
	public int create(Map<String, Object> map) {
		return dao.create(sst, map);
	}
	
	//가장 최근 배포한 설문지의 질문 답변 리스트
	@Override
	public SurveyDocVo getRecentSurveyQnAList() {
		return dao.getRecentSurveyQnAList(sst);
	}

	@Override
	public List<SurveyDocVo> titleList(PageVo pv) {
		return dao.titleList(sst , pv);
	}

	@Override
	public int getSurveyCnt() {
		return dao.getSurveyCnt(sst);
	}

	@Override
	public List<SurveyQuestionVo> geteQuestionList(String no) {
		return dao.geteQuestionList(sst,no);
	}

	@Override
	public List<SurveyAnswerVo> answerByOneQuestion(String no, PageVo answerListPv) {
		return dao.answerByOneQuestion(sst,no, answerListPv);
	}

	@Override
	public int getAnswerCnt(String no) {
		return dao.getAnswerCnt(sst,no);
	}

	@Override
	public List<SurveyAnswerVo> answerByOneQuestionByUser(String no, String answerer) {
		return dao.answerByOneQuestionByUser(sst,no, answerer);
	}

	@Override
	public List<SurveyAnswerVo> getSurveySelectQnaTotalList(String no) {
		return dao.getSurveySelectQnaTotalList(sst,no);
	}


	

	

}
