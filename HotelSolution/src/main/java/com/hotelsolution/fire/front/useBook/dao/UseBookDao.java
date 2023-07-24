package com.hotelsolution.fire.front.useBook.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useBook.vo.UseBookVo;

public interface UseBookDao {

	List<Integer> getBookNo(SqlSessionTemplate sst, String startDate, String endDate);

	List<UseBookVo> getRoomList(SqlSessionTemplate sst, List<Integer> numList, PageVo pv);

	int getRoomCnt(SqlSessionTemplate sst, List<Integer> numList);

}
