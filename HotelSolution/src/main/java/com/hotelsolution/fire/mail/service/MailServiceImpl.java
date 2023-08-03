package com.hotelsolution.fire.mail.service;

import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.mail.dao.MailDao;
import com.hotelsolution.fire.mail.vo.ContractMember;
import com.hotelsolution.fire.mail.vo.MailVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService{

    private final MailDao mailDao;
    private final SqlSessionTemplate sqlSessionTemplate;




    @Override
    public int getMailListCnt() {
        return mailDao.getMailListCnt(sqlSessionTemplate);
    }

    @Override
    public List<CompanyBoardVo> getAllCompanyMailList(PageVo pv) {
        return mailDao.getAllMailList(sqlSessionTemplate, pv);
    }



    @Override
    public MailVo mailDetailViewByNo(String senderEmpNo) {
        return mailDao.mailDetailViewByNo(sqlSessionTemplate,senderEmpNo);
    }

    @Override
    public int sendMail(MailVo mailVo, List<String> receivers, List<String> ccList) {
        int success = 0;
        MailVo savedMailVo = mailDao.sendMail(sqlSessionTemplate, mailVo);

        if (savedMailVo != null && savedMailVo.getEmailNo() != null) {
            for (String receiver : receivers) {
                mailDao.insertEmailReceiver(sqlSessionTemplate, savedMailVo.getEmailNo(), receiver);
            }

            if (ccList != null && !ccList.isEmpty()) {
                for (String cc : ccList) {
                    if (cc != null && !cc.trim().isEmpty()) {
                        mailDao.insertEmailCC(sqlSessionTemplate, savedMailVo.getEmailNo(), cc);
                    }
                }
            }

            success = 1;
        }

        return success;
    }

    @Override
    public List<ContractMember> viewAllContractMember() {
        return mailDao.viewAllContractMember(sqlSessionTemplate);
    }

}
