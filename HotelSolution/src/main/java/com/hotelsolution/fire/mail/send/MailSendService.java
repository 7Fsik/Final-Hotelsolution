package com.hotelsolution.fire.mail.send;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotelsolution.fire.member.dao.MemberDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MailSendService {

	private JavaMailSender mailSender;
	
	public MailSendService(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	private String getKey(int size) {
		Random r = new Random();
		String checkNum = Integer.toString(r.nextInt(888888) + 111111);
		return checkNum;
	}
	
	public String sendAuthMail(String email) throws Exception {
		String authKey = getKey(6);
		MimeMessage mailMessage = mailSender.createMimeMessage();
		String mailContent = "인증번호 : " +authKey; //보낼메시지
		mailMessage.setSubject("비밀번호 재설정 인증 코드입니다." , "UTF-8");
		mailMessage.setText(mailContent , "UTF-8" , "html");
		mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		mailSender.send(mailMessage);
		
		return authKey;
	}

	


	
}
