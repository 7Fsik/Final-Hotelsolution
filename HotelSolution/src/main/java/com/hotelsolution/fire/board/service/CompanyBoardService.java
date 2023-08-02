package com.hotelsolution.fire.board.service;

import com.hotelsolution.fire.board.vo.CompanyBoardCategoryVo;
import com.hotelsolution.fire.board.vo.CompanyBoardCommentVo;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

import java.util.List;

public interface CompanyBoardService {

    // 전체 사내 게시글 조회
    List<CompanyBoardVo> getAllCompanyBoardList (PageVo pv);

    int getCompanyBoardCnt();



    List<CompanyBoardCategoryVo> getCategoryList();

    int CompanyBoardPostByNo(CompanyBoardVo companyBoardVo);

    void increaseCompanyBoardHit(int no);

    CompanyBoardVo getCompanyBoardDetailByNo(int no);

    int companyBoardDeleteByNo(int no);

    CompanyBoardVo getBoardInfoByNo(int no);

    int writeCommentByNo(CompanyBoardCommentVo companyBoardCommentVo);

    int companyBoardEditByNo(CompanyBoardVo companyBoardVo);

    List<CompanyBoardCommentVo> getAllCommentListByNo(int no, PageVo pageVo);

    int getBoardCommentCnt(int boardNo);

    int deleteCommentOneByNo(CompanyBoardCommentVo companyBoardCommentVo);

    int editCommentOneByNo(CompanyBoardCommentVo companyBoardCommentVo);

}
