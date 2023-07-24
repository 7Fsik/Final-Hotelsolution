package com.hotelsolution.fire.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao{

	@Override
	public int join(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("member.join" , vo);
	}

	@Override
	public MemberVo login(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.login" , vo);
	}

	@Override
	//비밀번호 재설정 이메일인증
	public MemberVo emailAuthenTication(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.findPwd" , vo);
	}

}
