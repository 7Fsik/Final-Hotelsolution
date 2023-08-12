package com.hotelsolution.fire.common.search.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotelsolution.fire.common.search.dao.SearchMemberDao;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class SearchMemberService {
	private final SqlSessionTemplate sst;
	private final SearchMemberDao dao;
	public List<MemberVo> getSearchList(Map<String, Object> map) {
		
		return  dao.getSearchList(sst,map);
		
	}
}
