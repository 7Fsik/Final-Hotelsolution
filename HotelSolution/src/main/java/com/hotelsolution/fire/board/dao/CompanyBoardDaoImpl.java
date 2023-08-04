package com.hotelsolution.fire.board.dao;

import com.hotelsolution.fire.board.vo.CompanyBoardCategoryVo;
import com.hotelsolution.fire.board.vo.CompanyBoardCommentVo;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Slf4j
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
        sst.selectOne("companyBoard.increaseCompanyBoardHit",no);
    }

    @Override
    public CompanyBoardVo getCompanyBoardDetailByNo(SqlSessionTemplate sst, int no) {
        return sst.selectOne("companyBoard.getCompanyBoardDetailByNo",no);
    }

    @Override
    public int companyBoardDeleteByNo(SqlSessionTemplate sst, int no) {
        return sst.update("companyBoard.deleteByNo",no);
    }

    @Override
    public CompanyBoardVo getBoardInfoByNo(SqlSessionTemplate sst, int no) {
        return sst.selectOne("companyBoard.getBoardInfoByNo",no);
    }

    @Override
    public int writeCommentByNo(SqlSessionTemplate sst, CompanyBoardCommentVo companyBoardCommentVo) {
        return sst.insert("companyBoard.writeCommentByNo",companyBoardCommentVo);
    }

    @Override
    public int CompanyBoardPostByNo(SqlSessionTemplate sst, CompanyBoardVo companyBoardVo) {
        return sst.insert("companyBoard.CompanyBoardPostByNo",companyBoardVo);
    }

    @Override
    public int companyBoardEditByNo(SqlSessionTemplate sst, CompanyBoardVo companyBoardVo) {
        return sst.update("companyBoard.companyBoardEditByNo",companyBoardVo);
    }

    @Override
    public List<CompanyBoardCommentVo> getAllCommentListByNo(SqlSessionTemplate sst, int no, PageVo pv) {

        RowBounds rowBounds = new RowBounds(pv.getOffset(), pv.getBoardLimit());
        return sst.selectList("companyBoard.getAllCommentListByNo",no,rowBounds);
    }


    @Override
    public int getBoardCommentCnt(SqlSessionTemplate sst, int boardNo) {
        return sst.selectOne("companyBoard.getBoardCommentCnt",boardNo);
    }

    @Override
    public int deleteCommentOneByNo(SqlSessionTemplate sst, CompanyBoardCommentVo companyBoardCommentVo) {

        return sst.delete("companyBoard.deleteCommentOneByNo", companyBoardCommentVo);

    }

    @Override
    public int editCommentOneByNo(SqlSessionTemplate sst, CompanyBoardCommentVo companyBoardCommentVo) {
        return sst.update("companyBoard.editCommentOneByNo",companyBoardCommentVo);
    }

    @Override
    public List<CompanyBoardVo> getBoardList(SqlSessionTemplate sst) {
        return sst.selectList("companyBoard.getBoardList");
    }

    public List<CompanyBoardVo> weekTopBoardList(SqlSessionTemplate sst) {
        return sst.selectList("companyBoard.weekTopBoardList",sst);
    }


}
