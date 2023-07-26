package com.hotelsolution.fire.board.dao;

import com.hotelsolution.fire.board.vo.CompanyBoardCategoryVo;
import com.hotelsolution.fire.board.vo.CompanyBoardVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;

public interface CompanyBoardDao {

    List<CompanyBoardVo> getAllCompanyBoardList(SqlSessionTemplate sst, PageVo pv);

    int getCompanyBoardCnt(SqlSessionTemplate sst);


    List<CompanyBoardCategoryVo> getCategoryList(SqlSessionTemplate sst);

    void increaseCompanyBoardHit(SqlSessionTemplate sst, int no);

    CompanyBoardVo getCompanyBoardDetailByNo(SqlSessionTemplate sst, int no);
}
