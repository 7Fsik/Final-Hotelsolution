package com.hotelsolution.fire.restaurant.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hotelsolution.fire.front.vo.DaySalesVo;
import com.hotelsolution.fire.front.vo.ItemVo;
import com.hotelsolution.fire.restaurant.dao.ResDao;
import com.hotelsolution.fire.restaurant.vo.MenuVo;
import com.hotelsolution.fire.restaurant.vo.RoomServiceVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ResServiceImpl implements ResService{
	
	private final ResDao rd;
	private final SqlSessionTemplate sst;

	@Override
	public List<ItemVo> getItemList(Map<String, String> paramMap) {
		return rd.getItemList(sst,paramMap);
	}

	@Override
	public int edit(Map<String, String> paramMap) {
		return rd.edit(sst,paramMap);
	}

	@Override
	public List<DaySalesVo> getDaySales() {
		return rd.getDaySales(sst);
	}

	@Override
	public List<String> getMonthSales(Map<String, Object> paramMap) {
		return rd.getMonthSales(sst,paramMap);
	}

	@Override
	public List<MenuVo> menuList(Map<String, String> paramMap) {
		return rd.menuList(sst,paramMap);
	}

	@Override
	public int menuEdit(Map<String, String> paramMap) {
		return rd.menuEdit(sst,paramMap);
	}

	@Override
	public int menuRemove(String foodNo) {
		return rd.menuRemove(sst,foodNo);
	}

	@Override
	public int plusMenu(Map<String, String> paramMap) {
		return rd.plusMenu(sst,paramMap);
	}

	@Override
	public List<RoomServiceVo> roomOrderList() {
		return rd.roomOrderList(sst);
	}

	@Override
	public int change(String listNo) {
		return rd.change(sst,listNo);
	}

}
