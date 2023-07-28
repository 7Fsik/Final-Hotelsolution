package com.hotelsolution.fire.front.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hotelsolution.fire.front.dao.FrontDao;
import com.hotelsolution.fire.front.vo.DaySalesVo;
import com.hotelsolution.fire.front.vo.ItemVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FrontServiceImpl implements FrontService{

	private final FrontDao fd;
	private final SqlSessionTemplate sst;
	
//	@Override
//	public List<ItemVo> itemList(Map<String, String> paramMap) {
//		return fd.itemList(sst,paramMap);
//	}

	@Override
	public List<ItemVo> getItemList(Map<String, String> paramMap) {
		return fd.getItemList(sst,paramMap);
	}

	@Override
	public int edit(Map<String, String> paramMap) {
		return fd.edit(sst,paramMap);
	}

	@Override
	public List<String> getMonthSales(Map<String, Object> paramMap) {
		return fd.getMonthSales(sst, paramMap);
	}

	@Override
	public List<DaySalesVo> getDaySales() {
		return fd.getDaySales(sst);
	}

	

}
