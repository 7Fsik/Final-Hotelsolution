package com.hotelsolution.fire.board.dao;

import com.hotelsolution.fire.board.service.CompanyBoardService;
import com.hotelsolution.fire.board.vo.CompanyBoardCategoryVo;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CompanyBoardDaoImpl implements CompanyBoardDao{


    @Override
    public List<CompanyBoardVo> getAllCompanyBoardList(SqlSessionTemplate sst, PageVo pv) {

        RowBounds rb = new RowBounds(pv.getOffset(),pv.getBoardLimit());
        return sst.selectList("companyBoard.getAllCompanyBoardList",null,rb);
    }

    @Override
    public int getCompanyBoardCnt(SqlSessionTemplate sst) {
        return sst.selectOne("companyBoard.getAllCompanyBoardCnt");
    }

    @Override
    public List<CompanyBoardCategoryVo> getCategoryList(SqlSessionTemplate sst) {
        return sst.selectList("companyBoard.getBoardCategoryList");
    }

    @Override
    public void increaseCompanyBoardHit(SqlSessionTemplate sst, int no) {
        sst.selectOne("companyBoard.increaseHit",no);
    }

    @Override
    public CompanyBoardVo getCompanyBoardDetailByNo(SqlSessionTemplate sst, int no) {
        return sst.selectOne("companyBoard.getCompanyBoardDetailByNo",no);
    }


    public int writeCompanyBoardPost(SqlSessionTemplate sst, CompanyBoardVo companyBoardVo) {
        return sst.insert("companyBoard.writeCompanyBoardPost",companyBoardVo);
    }
}
