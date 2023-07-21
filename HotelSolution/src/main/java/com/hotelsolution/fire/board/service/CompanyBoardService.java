package com.hotelsolution.fire.board.service;

import com.hotelsolution.fire.board.vo.CompanyBoardCategoryVo;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;

import java.util.List;

public interface CompanyBoardService {

    // 전체 사내 게시글 조회
    List<CompanyBoardVo> getAllCompanyBoardList (PageVo pv);

    int getCompanyBoardCnt();



    List<CompanyBoardCategoryVo> getCategoryList();

    int writeCompanyBoardPost(CompanyBoardVo companyBoardVo);
}
