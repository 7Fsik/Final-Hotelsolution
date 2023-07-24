package com.hotelsolution.fire.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.member.dao.MemberDao;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class MemberServiceImpl implements MemberService{
	
	private final SqlSessionTemplate sst;
	private final MemberDao dao;
	private final BCryptPasswordEncoder pwdEncoder;
	
	@Override
	//회원가입
	public int join(MemberVo vo) {
		
		//암호화
		String pwd = vo.getPassword();
		String newPwd = pwdEncoder.encode(pwd);
		vo.setPassword(newPwd);
		
		return dao.join(sst, vo);
	}

	@Override
	@ResponseBody
	//로그인
	public MemberVo login(MemberVo vo) {
		

		MemberVo loginMember = dao.login(sst, vo);
		
		boolean isMatch = pwdEncoder.matches(vo.getPassword(), loginMember.getPassword());
		
		if(!isMatch) {
			throw new RuntimeException();
		}
		
		return loginMember;
	}

	@Override
	//비밀번호 재설정 (이메일 인증)
	public boolean emailAuthenTication(MemberVo vo) {
		
		MemberVo emailCheck = dao.emailAuthenTication(sst,vo);
		
		return emailCheck != null;
	}

}//class





