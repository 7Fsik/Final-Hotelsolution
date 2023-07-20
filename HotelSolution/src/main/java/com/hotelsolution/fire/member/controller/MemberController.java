package com.hotelsolution.fire.member.controller;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotelsolution.fire.member.service.MemberService;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequestMapping("member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	
	private final MemberService service;
	
	//회원가입(화면)
	@GetMapping("join")
	public void join() {
		
	}
	
	//회원가입
	@PostMapping("join")
	public String join(MemberVo vo) {
		log.info(vo.toString());
		int result = service.join(vo);
		
		if(result != 1) {
			throw new RuntimeException("로그인 실패");
		}
		
		return "redirect:/";
		
	}//join
	
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
