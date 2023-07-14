package com.hotelsolution.fire.hr.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.hr.vo.SurveyAnswerVo;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.hr.vo.SurveyQuestionVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

public interface SurveyService {
	int write(Map<String, Object> map);

	List<SurveyDocVo> titleList(PageVo pv);
	
	SurveyDocVo getRecentSurveyQnAList();

	int getSurveyCnt();

	List<SurveyQuestionVo> geteQuestionList(String no);

	List<SurveyAnswerVo> answerByOneQuestion(String no, PageVo answerListPv);

	int getAnswerCnt(String no);

	List<SurveyAnswerVo> answerByOneQuestionByUser(String no, String answerer);
}
