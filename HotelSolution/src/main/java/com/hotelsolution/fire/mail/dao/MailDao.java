package com.hotelsolution.fire.mail.dao;

import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.mail.vo.ContractMember;
import com.hotelsolution.fire.mail.vo.MailVo;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;

public interface MailDao {
    int getAllCompanyBoardCnt(SqlSessionTemplate sqlSessionTemplate);
    int getMailListCnt(SqlSessionTemplate sqlSessionTemplate);
    List<CompanyBoardVo> getAllMailList(SqlSessionTemplate sqlSessionTemplate, PageVo pv);

    MailVo mailDetailViewByNo(SqlSessionTemplate sqlSessionTemplate, String senderEmpNo);

    MailVo sendMail(SqlSessionTemplate sqlSessionTemplate, MailVo mailVo);

    int insertEmailReceiver(SqlSessionTemplate sqlSessionTemplate, Integer emailNo, String receiver);
    int insertEmailCC(SqlSessionTemplate sqlSessionTemplate, Integer emailNo, String cc);

    List<ContractMember> viewAllContractMember(SqlSessionTemplate sqlSessionTemplate);

}
