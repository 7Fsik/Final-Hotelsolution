package com.hotelsolution.fire.front.useBook.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useBook.vo.UseBookVo;

public interface UseBookService {

	List<Integer> getBookNo(String startDate, String endDate);

	List<UseBookVo> getRoomList(List<Integer> numList, PageVo pv);

	int getRoomCnt(List<Integer> numList);

}
