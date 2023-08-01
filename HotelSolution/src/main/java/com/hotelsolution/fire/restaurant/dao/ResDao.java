package com.hotelsolution.fire.restaurant.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.front.vo.DaySalesVo;
import com.hotelsolution.fire.front.vo.ItemVo;

public interface ResDao {
	//물품
	List<ItemVo> getItemList(SqlSessionTemplate sst, Map<String, String> paramMap);
	int edit(SqlSessionTemplate sst, Map<String, String> paramMap);
	//매출
	List<DaySalesVo> getDaySales(SqlSessionTemplate sst);
	List<String> getMonthSales(SqlSessionTemplate sst, Map<String, Object> paramMap);

}
