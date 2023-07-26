package com.hotelsolution.fire.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao{

	@Override
	//회원가입
	public int join(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("member.join" , vo);
	}

	@Override
	//로그인
	public MemberVo login(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.login" , vo);
	}

	@Override
	//비밀번호 재설정 이메일인증
	public MemberVo emailAuthenTication(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.findPwd" , vo);
	}

	@Override
	//인증번호 멤버테이블에 업데이트
	public int updateMailKey(SqlSessionTemplate sst, Map<String, Object> emailKey) {
		return sst.update("member.updateMailKey" , emailKey);
	}
	
	@Override
	//메일로 받은 인증번호가 맞는지 아닌지 판단
	public String emailKeyRightOrNo(SqlSessionTemplate sst, String email) {
		return sst.selectOne("member.emailKeyRightOrNo" , email);
	}

	@Override
	//비밀번호 재설정
	public int passwordReset(SqlSessionTemplate sst, Map<String, String> params) {
		return sst.update("member.changePwd", params);
	}



	

}
