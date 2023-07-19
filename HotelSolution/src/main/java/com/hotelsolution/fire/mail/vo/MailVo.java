package com.hotelsolution.fire.mail.vo;

import lombok.Data;

@Data
public class MailVo {
    private String emailNo;
    private String senderEmpNo;
    private String title;
    private String content;
    private String enrollDate;
    private String emailCcNo;
    private String readYn;
    private String dropYn;
    private String emailReceiverNo;
    private String receiverEmpNo;

}
