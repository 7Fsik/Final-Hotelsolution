package com.hotelsolution.fire.front.status.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.status.vo.StatusVo;

public interface StatusDao {
	
	// 객실 리스트
	List<StatusVo> list(SqlSessionTemplate sst, PageVo pv, String searchType ,String searchValue, String checkSelect);
	//객실 갯수 
	int getRoomCnt(SqlSessionTemplate sst);
	//객실 detail
	StatusVo getRoomByNo(SqlSessionTemplate sst, int no);
	// 상태 수정
	int roomStatusEdit(SqlSessionTemplate sst, StatusVo vo);

}
