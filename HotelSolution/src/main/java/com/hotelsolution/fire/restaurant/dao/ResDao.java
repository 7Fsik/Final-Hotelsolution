package com.hotelsolution.fire.restaurant.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hotelsolution.fire.front.vo.DaySalesVo;
import com.hotelsolution.fire.front.vo.ItemVo;
import com.hotelsolution.fire.restaurant.vo.MenuVo;

public interface ResDao {
	//물품
	List<ItemVo> getItemList(SqlSessionTemplate sst, Map<String, String> paramMap);
	int edit(SqlSessionTemplate sst, Map<String, String> paramMap);
	//매출
	List<DaySalesVo> getDaySales(SqlSessionTemplate sst);
	List<String> getMonthSales(SqlSessionTemplate sst, Map<String, Object> paramMap);
	
	//메뉴관리 
	List<MenuVo> menuList(SqlSessionTemplate sst, Map<String, String> paramMap);
	//메뉴수정
	int menuEdit(SqlSessionTemplate sst, Map<String, String> paramMap);
	int menuRemove(SqlSessionTemplate sst, String foodNo);
	//메뉴 삭제 
	int plusMenu(SqlSessionTemplate sst, Map<String, String> paramMap);

}
