package com.hotelsolution.fire.member.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.member.vo.MemberVo;

public interface MemberDao {
	
	int join(SqlSessionTemplate sst , MemberVo vo);

	MemberVo login(SqlSessionTemplate sst , MemberVo vo);

	MemberVo emailAuthenTication(SqlSessionTemplate sst, MemberVo vo);
	
}
