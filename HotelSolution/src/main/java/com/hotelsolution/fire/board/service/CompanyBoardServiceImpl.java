package com.hotelsolution.fire.board.service;

import com.hotelsolution.fire.board.dao.CompanyBoardDaoImpl;
import com.hotelsolution.fire.board.vo.CompanyBoardCategoryVo;
import com.hotelsolution.fire.board.vo.CompanyBoardCommentVo;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class CompanyBoardServiceImpl implements CompanyBoardService {

    private final SqlSessionTemplate sst;
    private final CompanyBoardDaoImpl dao;


    @Override
    public List<CompanyBoardVo> getAllCompanyBoardList(PageVo pv)
    {
        return dao.getAllCompanyBoardList(sst, pv);
    }

    @Override
    public int getCompanyBoardCnt() {
        return dao.getCompanyBoardCnt(sst);
    }

    @Override
    public List<CompanyBoardCategoryVo> getCategoryList() {
        return dao.getCategoryList(sst);
    }

    @Override
    public int CompanyBoardPostByNo(CompanyBoardVo companyBoardVo) {
        return dao.CompanyBoardPostByNo(sst, companyBoardVo);
    }

    @Override
    public void increaseCompanyBoardHit(int no) {
        dao.increaseCompanyBoardHit(sst,no);
    }

    @Override
    public CompanyBoardVo getCompanyBoardDetailByNo(int no) {
        return dao.getCompanyBoardDetailByNo(sst,no);
    }

    @Override
    public int companyBoardDeleteByNo(int no) {
        return dao.companyBoardDeleteByNo(sst,no);
    }

    @Override
    public CompanyBoardVo getBoardInfoByNo(int no) {
        return dao.getBoardInfoByNo(sst,no);
    }

    @Override
    public int writeCommentByNo(CompanyBoardCommentVo companyBoardCommentVo) {
        return dao.writeCommentByNo(sst,companyBoardCommentVo);
    }

    @Override
    public int companyBoardEditByNo(CompanyBoardVo companyBoardVo) {
        return dao.companyBoardEditByNo(sst, companyBoardVo);
    }

    @Override
    public List<CompanyBoardCommentVo> getAllCommentListByNo(int no, PageVo pageVo) {
        return dao.getAllCommentListByNo(sst, no,pageVo);
    }

    @Override
    public int getBoardCommentCnt(int boardNo) {
        return dao.getBoardCommentCnt(sst,boardNo);
    }

    @Override
    public int deleteCommentOneByNo(String commentWriterNo) {
        return 0;
    }


}
