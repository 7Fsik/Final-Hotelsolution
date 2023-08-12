package com.hotelsolution.fire.common.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.member.vo.MemberVo;

@Repository
public class SearchMemberDao {

	public List<MemberVo> getSearchList(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.selectList("member.getMemberList",map);
	}

	
}
