package com.hotelsolution.fire.hr.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.hr.vo.SurveyAnswerVo;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.hr.vo.SurveyQuestionVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

public interface SurveyService {
	int create(Map<String, Object> map);

	List<SurveyDocVo> titleList(PageVo pv, String searchValue);
	
	SurveyDocVo getRecentSurveyQnAList();

	int getSurveyCnt(String searchValue);

	List<SurveyQuestionVo> geteQuestionList(String no);

	List<SurveyAnswerVo> answerByOneQuestion(String no, PageVo answerListPv);

	int getAnswerCnt(Map<String, String> map2);

	List<SurveyAnswerVo> answerByOneQuestionByUser(String no, String answerer);

	List<SurveyAnswerVo> getSurveySelectQnaTotalList(String no);

	List<SurveyDocVo> newTitleList(PageVo pv, String searchValue, String no);

	List<SurveyQuestionVo> getNewQuestionList(String no, String no2);

	int write(Map<String, Object> map);

}
