package com.hotelsolution.fire.hr.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.page.vo.PageVo;

public interface SurveyDao {
	
	List<SurveyDocVo> titleList(SqlSessionTemplate sst, PageVo pv);

	int write(SqlSessionTemplate sst, Map<String, Object> map);

	SurveyDocVo getRecentSurveyQnAList(SqlSessionTemplate sst);

	int getSurveyCnt(SqlSessionTemplate sst);

	List<String> geteQuestionList(SqlSessionTemplate sst, String no);

}
