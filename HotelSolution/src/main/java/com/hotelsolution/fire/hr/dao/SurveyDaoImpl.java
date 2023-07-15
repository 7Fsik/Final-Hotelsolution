package com.hotelsolution.fire.hr.dao;

import java.lang.ProcessHandle.Info;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.hr.vo.SurveyAnswerVo;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;
import com.hotelsolution.fire.hr.vo.SurveyQuestionVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class SurveyDaoImpl implements SurveyDao{
	
	@Override
	public List<SurveyDocVo> titleList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("survey.titleList",null,rb);
	}

	@Override
	public int create(SqlSessionTemplate sst, Map<String, Object> map) {
		List<String>list = (List<String>) map.get("questions"); 
		int result = sst.insert("survey.insertDocument", map);
		if(result !=1) {
			throw new RuntimeException("설문지가 제목이 없다.");
		}
		for (int i = 0 ; i < 4 ; i ++) {
			String question = list.get(i);
			result = sst.insert("survey.insertQuestions", question);
		}
		return result;
	}

	@Override
	public SurveyDocVo getRecentSurveyQnAList(SqlSessionTemplate sst) {
		return sst.selectOne("survey.getRecentSurveyQnAList");
	}

	@Override
	public int getSurveyCnt(SqlSessionTemplate sst) {
		return sst.selectOne("survey.getSurveyCnt");
	}

	@Override
	public List<SurveyQuestionVo> geteQuestionList(SqlSessionTemplate sst, String no) {
		return sst.selectList("survey.geteQuestionList",no);
	}

	@Override
	public List<SurveyAnswerVo> answerByOneQuestion(SqlSessionTemplate sst, String no,  PageVo answerListPv) {
		RowBounds rb = new RowBounds(answerListPv.getOffset(), answerListPv.getBoardLimit());
		return sst.selectList("survey.answerByOneQuestion",no , rb);
	}

	@Override
	public int getAnswerCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("survey.getAnswerCnt" ,no);
	}

	@Override
	public List<SurveyAnswerVo> answerByOneQuestionByUser(SqlSessionTemplate sst, String no, String answerer) {
		Map<String, String> map = new HashMap();
		map.put("no",no);
		map.put("answerer", answerer);
		return sst.selectList("survey.answerByOneQuestionByUser",map);
	}

	@Override
	public List<SurveyAnswerVo> getSurveySelectQnaTotalList(SqlSessionTemplate sst, String no) {
		return sst.selectList("survey.getSurveySelectQnaTotalList",no);
	}

	
	
	
	

}
