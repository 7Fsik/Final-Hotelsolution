package com.hotelsolution.fire.hr.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hotelsolution.fire.hr.dao.VacationDocDao;
import com.hotelsolution.fire.hr.vo.VacationDocVo;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class VacationDocService {

	private final VacationDocDao dao;
	private final SqlSessionTemplate sst;
	
	public List<VacationDocVo> getSubmitList(Map<String, Object> map) {
		return dao.getSubmitList(sst,map);
	}

	public int getSubmitListCnt(Map<String, Object> map) {
		return dao.getSubmitListCnt(sst, map);
	}

	public List<VacationDocVo> getNoSubmitList() {
		return dao.getNoSubmitList(sst);
	}

}
