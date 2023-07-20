package com.hotelsolution.fire.mail.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface MailDao {
    int getAllCompanyBoardCnt(SqlSessionTemplate sqlSessionTemplate);
}
