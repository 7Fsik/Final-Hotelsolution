package com.hotelsolution.fire.mail.controller;

import com.hotelsolution.fire.mail.service.MailService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mail")
public class MailController {

    private final MailService mailService;

    @GetMapping("list")
    public String mailList(){
        return "mail/list";
    }

    @GetMapping("post")
    public String sendMailFormByNo(){
        return "mail/post";
    }
}
