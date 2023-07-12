package com.hotelsolution.fire.hr.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.hr.dao.SurveyDao;
import com.hotelsolution.fire.hr.vo.SurveyDocVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class SurveyService {
	
	private final SurveyDao dao;
	private final SqlSessionTemplate sst;
	
	public int write(Map<String, Object> map) {
		return dao.write(sst, map);
		
	}

	public List<SurveyDocVo> titleList() {
		return dao.titleList(sst);
		
	}

	public SurveyDocVo getRecentSurveyQnAList() {
		return dao.getRecentSurveyQnAList(sst);
	}

}
