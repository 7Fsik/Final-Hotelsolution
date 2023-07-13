package com.hotelsolution.fire.hr.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.page.vo.PageVo;

public interface SurveyService {
	int write(Map<String, Object> map);

	List<SurveyDocVo> titleList(PageVo pv);
	
	SurveyDocVo getRecentSurveyQnAList();

	int getSurveyCnt();

	List<String> geteQuestionList(String no);
}
