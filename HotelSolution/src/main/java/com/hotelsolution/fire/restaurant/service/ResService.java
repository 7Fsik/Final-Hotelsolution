package com.hotelsolution.fire.restaurant.service;

import java.util.List;
import java.util.Map;

import com.hotelsolution.fire.front.vo.DaySalesVo;
import com.hotelsolution.fire.front.vo.ItemVo;
import com.hotelsolution.fire.restaurant.vo.MenuVo;
import com.hotelsolution.fire.restaurant.vo.RoomServiceVo;

public interface ResService {

	//물품
	List<ItemVo> getItemList(Map<String, String> paramMap);
	int edit(Map<String, String> paramMap);
	
	//매출
	List<DaySalesVo> getDaySales();
	List<String> getMonthSales(Map<String, Object> paramMap);
	
	//메뉴관리 
	List<MenuVo> menuList(Map<String, String> paramMap);
	//수정
	int menuEdit(Map<String, String> paramMap);
	int menuRemove(String foodNo);
	//메뉴추가 
	int plusMenu(Map<String, String> paramMap);
	//음식 주문내역
	List<RoomServiceVo> roomOrderList();
	//완료
	int change(String listNo);

}
