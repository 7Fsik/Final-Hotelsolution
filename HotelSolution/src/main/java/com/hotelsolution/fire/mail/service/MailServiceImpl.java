package com.hotelsolution.fire.mail.service;

import com.hotelsolution.fire.mail.dao.MailDao;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService{

    private final MailDao mailDao;
    private final SqlSessionTemplate sqlSessionTemplate;


    @Override
    public int getAllCompanyBoardCnt() {
        return mailDao.getAllCompanyBoardCnt(sqlSessionTemplate);
    }
}
