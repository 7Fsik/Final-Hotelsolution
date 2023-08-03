package com.hotelsolution.fire.mail.dao;

import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.mail.vo.ContractMember;
import com.hotelsolution.fire.mail.vo.MailVo;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MailDaoImpl implements MailDao{
    @Override
    public int getAllCompanyBoardCnt(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("Mail.getAllCompanyBoardCnt");
    }

    @Override
    public int getMailListCnt(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("Mail.getMailListCnt");
    }

    @Override
    public List<CompanyBoardVo> getAllMailList(SqlSessionTemplate sqlSessionTemplate, PageVo pv) {
        RowBounds rb = new RowBounds(pv.getOffset(),pv.getBoardLimit());
        return sqlSessionTemplate.selectList("Mail.getAllMailList",null,rb);
    }



    @Override
    public MailVo mailDetailViewByNo(SqlSessionTemplate sqlSessionTemplate, String senderEmpNo) {
        return sqlSessionTemplate.selectOne("Mail.mailDetailViewByNo",senderEmpNo);
    }

    @Override
    public MailVo sendMail(SqlSessionTemplate sqlSessionTemplate, MailVo mailVo) {
       sqlSessionTemplate.insert("Mail.sendMail",mailVo);

       return mailVo;
    }

    @Override
    public int insertEmailReceiver(SqlSessionTemplate sqlSessionTemplate, Integer emailNo, String receiver) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("emailNo", emailNo);
        params.put("receiver", receiver);
        return sqlSessionTemplate.insert("Mail.insertEmailReceiver", params);
    }

    @Override
    public int insertEmailCC(SqlSessionTemplate sqlSessionTemplate, Integer emailNo, String cc) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("emailNo", emailNo);
        params.put("cc", cc);
        return sqlSessionTemplate.insert("Mail.insertEmailCC", params);
    }

    @Override
    public List<ContractMember> viewAllContractMember(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectList("Mail.viewAllContractMember");
    }


}
