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
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class CompanyBoardServiceImpl implements CompanyBoardService {

    private final SqlSessionTemplate sst;
    private final CompanyBoardDaoImpl dao;


    @Override
    public List<CompanyBoardVo> getAllCompanyBoardList(PageVo pv, Map<String, String> paramMap)
    {
        return dao.getAllCompanyBoardList(sst, pv, paramMap);
    }

    @Override
    public int getCompanyBoardCnt(Map<String, String> paramMap) {

        return dao.getCompanyBoardCnt(sst, paramMap);
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
    public int deleteCommentOneByNo(CompanyBoardCommentVo companyBoardCommentVo) {
        return dao.deleteCommentOneByNo(sst, companyBoardCommentVo);
    }

    @Override
    public int editCommentOneByNo(CompanyBoardCommentVo companyBoardCommentVo) {
        return dao.editCommentOneByNo(sst, companyBoardCommentVo);
    }

    @Override
    public List<CompanyBoardVo> weekTopBoardList() {
        return dao.weekTopBoardList(sst);
    }

    @Override
    public List<CompanyBoardVo> getBoardList() {
        return dao.getBoardList(sst);
    }


}
