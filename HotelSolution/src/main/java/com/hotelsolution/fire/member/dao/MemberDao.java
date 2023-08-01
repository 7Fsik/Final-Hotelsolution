package com.hotelsolution.fire.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.member.vo.MemberVo;

public interface MemberDao {
	
	int join(SqlSessionTemplate sst , MemberVo vo);

	MemberVo login(SqlSessionTemplate sst , MemberVo vo);

	MemberVo emailAuthenTication(SqlSessionTemplate sst, MemberVo vo);

	int passwordReset(SqlSessionTemplate sst, Map<String, String> params);

	int updateMailKey(SqlSessionTemplate sst, Map<String, Object> emailKey);

	String emailKeyRightOrNo(SqlSessionTemplate sst, String email);

	List<MemberVo> getAllMembers(SqlSessionTemplate sst, MemberVo vo);


}
