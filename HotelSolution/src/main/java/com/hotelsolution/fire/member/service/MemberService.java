package com.hotelsolution.fire.member.service;

import com.hotelsolution.fire.member.vo.MemberVo;

public interface MemberService {

	int join(MemberVo vo);
	
	MemberVo login(MemberVo vo);

	boolean emailAuthenTication(MemberVo vo);
	
}
