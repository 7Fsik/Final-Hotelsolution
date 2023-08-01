package com.hotelsolution.fire.member.service;

import java.util.List;

import com.hotelsolution.fire.member.vo.MemberVo;

public interface MemberService {

	int join(MemberVo vo);
	
	MemberVo login(MemberVo vo);

	boolean emailAuthenTication(MemberVo vo);

	int passwordReset(String password, String email);

	int updateMailKey(String email, String authKey);

	String emailKeyRightOrNo(String email);

	List<MemberVo> getAllMembers(MemberVo vo);

}
