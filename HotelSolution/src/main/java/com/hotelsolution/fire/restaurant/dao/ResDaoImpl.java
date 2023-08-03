package com.hotelsolution.fire.restaurant.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotelsolution.fire.front.vo.DaySalesVo;
import com.hotelsolution.fire.front.vo.ItemVo;
import com.hotelsolution.fire.restaurant.vo.MenuVo;

@Repository
public class ResDaoImpl implements ResDao{
	///////////////////////////물품
	@Override
	public List<ItemVo> getItemList(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectList("restaurant.getItemList", paramMap);
	}

	@Override
	public int edit(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.update("restaurant.edit", paramMap);
	}
	
	//////////////////////////매출

	@Override
	public List<DaySalesVo> getDaySales(SqlSessionTemplate sst) {
		return sst.selectList("restaurant.getDaySales");
	}

	@Override
	public List<String> getMonthSales(SqlSessionTemplate sst, Map<String, Object> paramMap) {
		return sst.selectList("restaurant.getMonthSales", paramMap);
	}

	@Override
	public List<MenuVo> menuList(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectList("restaurant.menuList", paramMap);
	}

	//메뉴수정
	@Override
	public int menuEdit(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.update("restaurant.menuEdit", paramMap);
	}

	@Override
	public int menuRemove(SqlSessionTemplate sst, String foodNo) {
		return sst.delete("restaurant.menuRemove", foodNo);
	}

	@Override
	public int plusMenu(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.insert("restaurant.plusMenu", paramMap);
	}

}
