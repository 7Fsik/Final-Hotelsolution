package com.hotelsolution.fire.mail.vo;

import lombok.Data;
import org.mybatis.spring.SqlSessionTemplate;

@Data
public class MailVo {
    private Integer emailNo; //이메일테이블 기본키 번호
    private String senderEmpNo; //발신자 사원번호
    private String title; //메일 제목
    private String content; //메일 내용
    private String enrollDate; //메일 작성자
    private String emailCcNo; //메일 참조자 작성번호
    private String readYn; //읽음여부
    private String dropYn; //삭제여부
    private String emailReceiverNo; // 수신자테이블 기본번호
    private String receiverEmpNo; //수신자 사원번호
    private String mailCategory;



}
