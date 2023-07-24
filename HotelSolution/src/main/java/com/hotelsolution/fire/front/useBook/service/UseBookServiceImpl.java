package com.hotelsolution.fire.front.useBook.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useBook.dao.UseBookDao;
import com.hotelsolution.fire.front.useBook.vo.UseBookVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UseBookServiceImpl implements UseBookService{
	
	private final UseBookDao ud;
	
	private final SqlSessionTemplate sst;

	@Override
	public List<Integer> getBookNo(String startDate, String endDate) {
		return ud.getBookNo(sst,startDate,endDate);
	}

	@Override
	public List<UseBookVo> getRoomList(List<Integer> numList,PageVo pv) {
		return ud.getRoomList(sst,numList,pv);
	}

	@Override
	public int getRoomCnt(List<Integer> numList) {
		return ud.getRoomCnt(sst,numList);
	}

}
