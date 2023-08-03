package com.hotelsolution.fire.mail.service;

import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.mail.vo.ContractMember;
import com.hotelsolution.fire.mail.vo.MailVo;

import java.util.List;

public interface MailService {

    //전체 메일 갯수 조회
    int getMailListCnt();

    List<CompanyBoardVo> getAllCompanyMailList(PageVo pv);

     MailVo mailDetailViewByNo(String loginMemberNo);

    int sendMail(MailVo mailVo, List<String> receivers, List<String> ccList);

    List<ContractMember> viewAllContractMember();


    //보낸 메일함 갯수 조회

    //받은 메일함 갯수 조회

    //전체 메일보기

    //받은 메일만보기

    //보낸 메일보기

    //휴지통 보기
}
