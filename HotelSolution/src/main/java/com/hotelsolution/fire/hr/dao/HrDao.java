package com.hotelsolution.fire.hr.dao;

import java.lang.ProcessHandle.Info;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.hr.vo.SurveyDocVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class HrDao {

	public List<SurveyDocVo> titleList(SqlSessionTemplate sst) {
		return sst.selectList("survey.titleList");
	}

	public int write(SqlSessionTemplate sst, Map<String, Object> map) {
		List<String>list = (List<String>) map.get("questions"); 
		int result = sst.insert("survey.insertDocument", map);
		if(result !=1) {
			throw new RuntimeException();
		}
		for (int i = 0 ; i < 4 ; i ++) {
			String question = list.get(i);
			result = sst.insert("survey.insertQuestions", question);
		}
		return result;
		
	}

	

}
