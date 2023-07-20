package com.hotelsolution.fire.front.status.service;

import java.util.List;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.status.vo.StatusVo;

public interface StatusService {
	
	//객실 상태관리 목록
	List<StatusVo> list(PageVo pv,String searchType ,String searchValue);

	//객실 리스트 갯수
	int getRoomCnt();
	
	//객실 detail
	StatusVo getRoomByNo(int no);

}
