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
	public List<SurveyDocVo> titleList(SqlSessionTemplate sst, PageVo pv, String searchValue) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("survey.titleList",searchValue,rb);
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
	public int getSurveyCnt(SqlSessionTemplate sst, String searchValue) {
		return sst.selectOne("survey.getSurveyCnt",searchValue);
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
	public int getAnswerCnt(SqlSessionTemplate sst, Map<String, String> map2) {
		return sst.selectOne("survey.getAnswerCnt" ,map2);
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

	@Override
	public List<SurveyDocVo> newTitleList(SqlSessionTemplate sst, PageVo pv,String searchValue, String no) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("searchValue",searchValue);
		map.put("no", no);
		System.out.println(map);
		return sst.selectList("survey.newTitleList",map,rb);
	}

	@Override
	public List<SurveyQuestionVo> getNewQuestionList(SqlSessionTemplate sst, String no, String no2) {
		Map<String, Object>map = new HashMap<String, Object>();
		int offset = 0;
	    int limit = 4;
	    RowBounds rb = new RowBounds(offset, limit);
		map.put("loginMemberNo",no);
		map.put("surveyDocNo", no2);
		System.out.println(map);
		return sst.selectList("survey.getNewQuestionList",map,rb);
	}

	@Override
	public int write(SqlSessionTemplate sst, Map<String, Object> map) {
		List<String>list = (List<String>) map.get("answers"); 
		List<String>list2 = (List<String>) map.get("nos"); 
		int result = 0;
		Map<String, Object>map2 = new HashMap<String, Object>();
		for (int i = 0 ; i < 4 ; i ++) {
			String answer = list.get(i);
			String no = list2.get(i);
			map2.put("answer", answer);
			map2.put("no", no);
			map2.put("loginMember", map.get("loginMember"));
			result = sst.insert("survey.write", map2);
			
		}
		
		return result;
	}

	
	
	
	

}
