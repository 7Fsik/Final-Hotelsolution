package com.hotelsolution.fire.member.controller;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Service
@RequestMapping("member")
public class MemberController {
	
	//회원가입(화면)
	@GetMapping("join")
	public void join() {
		
	}
	//회원가입
	
	//로그인(화면)
	@GetMapping("login")
	public void login() {
		
	}
	
	//로그인
	
	//비밀번호 이메일 인증(화면)
	@GetMapping("emailAuthentication")
	public void emailAuthentication() {
		
	}
	
	//비밀번호 이메일 인증
	
	
	//비밀번호 재설정(화면)
	@GetMapping("passwordReset")
	public void passwordReset() {
		
	}
	
	//비밀번호 재설정
	

	
	
	
	
	
	
}
