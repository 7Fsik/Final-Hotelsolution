package com.hotelsolution.fire.restaurant.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.front.vo.DaySalesVo;
import com.hotelsolution.fire.front.vo.ItemVo;

public interface ResService {

	//물품
	List<ItemVo> getItemList(Map<String, String> paramMap);
	int edit(Map<String, String> paramMap);
	
	//매출
	List<DaySalesVo> getDaySales();
	List<String> getMonthSales(Map<String, Object> paramMap);

}
