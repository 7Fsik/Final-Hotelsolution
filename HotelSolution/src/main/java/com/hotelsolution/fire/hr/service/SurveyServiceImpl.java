package com.hotelsolution.fire.hr.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.hr.dao.SurveyDao;
import com.hotelsolution.fire.hr.dao.SurveyDaoImpl;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class SurveyServiceImpl implements SurveyService {
	
	private final SurveyDao dao;
	private final SqlSessionTemplate sst;
	@Override
	public int write(Map<String, Object> map) {
		return dao.write(sst, map);
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
	public List<String> geteQuestionList(String no) {
		return dao.geteQuestionList(sst,no);
	}
	

	

}
