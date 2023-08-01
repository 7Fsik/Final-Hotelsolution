package com.hotelsolution.fire.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	//인증번호 멤버테이블 컬럼에 업데이트
	public int updateMailKey(String email, String authKey) {
		
		Map<String, Object> emailKey = new HashMap<>();
		emailKey.put("email", email);
		emailKey.put("authKey", authKey);
		
		return dao.updateMailKey(sst, emailKey);
	}
	

	@Override
	//메일로 받은 인증번호가 맞는지 아닌지 판단
	public String emailKeyRightOrNo(String email) {
		return dao.emailKeyRightOrNo(sst,email);
		
	}


	@Override
	public int passwordReset(String password, String email) {
		
		String pwd = password;
		String newPwd = pwdEncoder.encode(pwd);

		Map<String, String> params = new HashMap<>();
		params.put("password", newPwd);
		params.put("email", email);
		
		
		
		return dao.passwordReset(sst,params);
	}

	@Override
	public List<MemberVo> getAllMembers(MemberVo vo) {
		return dao.getAllMembers(sst,vo);
	}

}//class





