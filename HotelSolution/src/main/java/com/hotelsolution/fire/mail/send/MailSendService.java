package com.hotelsolution.fire.mail.send;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {

	private JavaMailSenderImpl mailSender;
	
	private String getKey(int size) {
		return "123456";
	}
	
	public String sendAuthMail(String mail) throws Exception {
		String authKey = getKey(6);
		MimeMessage mailMessage = mailSender.createMimeMessage();
		String mailContent = "인증번호 : " +authKey; //보낼메시지
		mailMessage.setSubject("비밀번호 재설정 인증 코드입니다." , "UTF-8");
		mailMessage.setText(mailContent , "UTF-8" , "html");
		mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
		mailSender.send(mailMessage);
		
		return authKey;
	}
	
}
