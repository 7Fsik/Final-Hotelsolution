package com.hotelsolution.fire.member.controller;


import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotelsolution.fire.member.service.MemberService;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

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
	public String join(MemberVo vo ,HttpServletRequest req) {
		log.info(vo.toString());
		
		int result = service.join(vo);
		
		if(result != 1) {
			throw new RuntimeException("회원가입 실패");
		}
		
		return "redirect:/member/login";
		
	}//join
	
	//로그인(화면)
	@GetMapping("login")
	public void login() {
		
	}
	
	//로그인
	@PostMapping("login")
	public String login(MemberVo vo , HttpSession session) {
		
		MemberVo loginMember = service.login(vo);
		log.info("로그인멤버 : {}" , loginMember);
		session.setAttribute("loginMember", loginMember);
		
		if(loginMember == null) {
			throw new RuntimeException("로그인 실패");
		}
		
		return "redirect:/";
		
	}//login
	
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
