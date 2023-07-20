package com.hotelsolution.fire.mail.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MailDaoImpl implements MailDao{
    @Override
    public int getAllCompanyBoardCnt(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("Mail.getAllCompanyBoardCnt");
    }

}
