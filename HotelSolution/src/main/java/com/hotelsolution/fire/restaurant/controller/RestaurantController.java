package com.hotelsolution.fire.restaurant.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.front.vo.DaySalesVo;
import com.hotelsolution.fire.front.vo.ItemVo;
import com.hotelsolution.fire.restaurant.service.ResService;
import com.hotelsolution.fire.restaurant.vo.MenuVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("restaurant")
public class RestaurantController {
	
	private final ResService rs;
	
	///////////////////////// 식당 테이블
	@GetMapping("table")
	public String table() {
		return "restaurant/table";
	}

	/////////////////////////////
	
	/////////////////////////식당 이용예약
	@GetMapping("useBook")
	public String useBook() {
		return"restaurant/useBook";
	}
	////////////////////////////////////
	
	
	//////////////////////////////룸서비스 주문내역
	@GetMapping("roomOrder")
	public String roomOrder() {
		return "restaurant/roomOrder";
	}
	
	///////////////////////////////////////////
	
	
	/////////////////////////////룸서비스 메뉴관리 
	@GetMapping("menuManage")
	public String menuManage() {
		return"restaurant/menuManage";
	}
	
	//////////////////////////////////
	
	
	///////////////////////////재고관리
	@GetMapping("articleManage")
	public String articleManage() {
		return"restaurant/articleManage";
	}
	
	@GetMapping("articleManage/getItemList")
	@ResponseBody
	public List<ItemVo> getItemList( Model model ,@RequestParam Map<String, String> paramMap) {
		
		List<ItemVo>getItemList = rs.getItemList(paramMap);
		
		return getItemList;
	}
	
	//물품 수정
	@GetMapping("articleManage/edit")
	@ResponseBody
	public int edit(@RequestParam Map<String,String>paramMap) {
		
		int result = rs.edit(paramMap);
		
		return result;
	}
	
	////////////////////////////////
	
	
	//////////////////////////////매출관리
	/////////////////////////////매출관리 
	@GetMapping("sales")
	public String sales(Model model) {
	
		List<DaySalesVo>dayVo = rs.getDaySales();
		
		
		model.addAttribute("dayVo",dayVo);
		
		return"restaurant/sales";
	}
	
	/////////////////////////////매출관리 
	@GetMapping("sales/getMonthSales")
	@ResponseBody
	public Map<String, Object> getMonthSales(String year,String month) {
	
		List<Integer> months = new ArrayList();
		List<Integer> years = new ArrayList();
		
		for(int i =0 ; i<6; i++) {
			int mm = Integer.parseInt(month)-i;
			int yy = Integer.parseInt(year);
			if(mm==0) {mm=12; yy=yy-1;}
			if(mm==-1) {mm=11; yy=yy-1;}
			if(mm==-2) {mm=10 ; yy=yy-1;}
			if(mm==-3) {mm=9; yy=yy-1;}
			if(mm==-4) {mm=8; yy=yy-1;}
			if(mm==-5) {mm=7; yy=yy-1;}
			months.add(mm);
			years.add(yy);
		}
	
		Map<String , Object> paramMap = new HashMap<String, Object>();
		paramMap.put("months", months);
		paramMap.put("years", years);
		
		
		List<String> salesList = rs.getMonthSales(paramMap);
		
		Map<String ,Object> salesMap = new HashMap<String,Object>();
		salesMap.put("salesList", salesList);
		salesMap.put("months", months);
		salesMap.put("years", years);
		
		
		return salesMap ;
	}
	///////////////////////////////////
	
	
	/////////////식당 룸 서비스 관리 
	@GetMapping("restaurant/roomService")
	public String roomService() {
		return"restaurant/roomService";
	}
	

	@GetMapping("menuList")
	@ResponseBody
	public List<MenuVo> menuList(String searchType , String searchValue , String selectValue){
		
		Map<String,String> paramMap = new HashMap<>();
		paramMap.put("searchValue", searchValue);
		paramMap.put("searchType", searchType);
		paramMap.put("selectValue", selectValue);
		
		List <MenuVo> menuList = rs.menuList(paramMap);
		
		return menuList ;
	}
	
	@GetMapping("edit")
	@ResponseBody
	public int menuEdit(@RequestParam Map<String,String>paramMap) {
		
		int result = rs.menuEdit(paramMap);
		
		return result ;
	}
	
	@GetMapping("menuRemove")
	@ResponseBody
	public int menuRemove(String foodNo) {
		
		int result =  rs.menuRemove(foodNo);
		
		return result ;
	}
	
	
	@PostMapping("plusMenu")
	@ResponseBody
	public int plusMenu(@RequestParam Map<String,String>paramMap) {
		
		int result = rs.plusMenu(paramMap);
		
		return result ;
	}
	
	
	
}//class
