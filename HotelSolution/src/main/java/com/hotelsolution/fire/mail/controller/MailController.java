package com.hotelsolution.fire.mail.controller;

import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.mail.service.MailService;
import com.hotelsolution.fire.mail.vo.ContractMember;
import com.hotelsolution.fire.mail.vo.MailVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.temp.FireConstPool;
import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mail")
public class MailController {

    private final MailService mailService;

    @GetMapping("list")
    public String allMailList(@RequestParam(value = "page", defaultValue = "1" ) int page, Model model, HttpSession session,MailVo mailVo){

//
//        int listCount = mailService.getMailListCnt();
//        int currentPage = page;
//        int pageLimit = FireConstPool.COMPANY_MAIL_PAGE_LIMIT;
//        int mailLimit = FireConstPool.COMPANY_MAIL_LIMIT;
//        PageVo pv = new PageVo(listCount,currentPage,pageLimit,mailLimit);

//        List<CompanyBoardVo> allCompanyBoardList = mailService.getAllCompanyMailList(pv);
//        model.addAttribute("allCompanyBoardList",allCompanyBoardList);
//        model.addAttribute("pv",pv);
        return "mail/list";
    }

    @GetMapping("post")
    public String sendMailFormByNo(){
        return "mail/post";
    }

    @PostMapping("post")
    public String sendMail
            (
            MailVo mailVo, Model model
                , HttpSession session
                    ,@RequestParam("receivers")List<String> receviers
                    ,@RequestParam("ccList") List<String> ccList
            )
    {
        MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        mailVo.setSenderEmpNo(loginMember.getNo());

        int mailResult = mailService.sendMail(mailVo,receviers,ccList);
        if(mailResult>0){
            return "mail/mailSuccess";

        }else{
            return "common/error";
        }
    }

    @GetMapping("detail")
    public String mailDetailViewByNo(HttpSession session, Model model, MailVo mailVo)
    {
        MemberVo loginMemberNo = (MemberVo) session.getAttribute("loginMember");
        String senderEmpNo = loginMemberNo.getNo();
        mailVo.setSenderEmpNo(senderEmpNo);


        model.addAttribute("mailVo",mailVo);
        return "mail/detail";
    }


    @ResponseBody
    @GetMapping("contact")
    public ResponseEntity<List<ContractMember>> viewAllContractMember() {

        List<ContractMember> contractMembers = mailService.viewAllContractMember();

        return ResponseEntity.ok(contractMembers);
    }



}
