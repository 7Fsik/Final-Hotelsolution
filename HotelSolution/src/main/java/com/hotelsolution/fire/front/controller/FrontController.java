package com.hotelsolution.fire.front.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.front.service.FrontService;
import com.hotelsolution.fire.front.vo.DaySalesVo;
import com.hotelsolution.fire.front.vo.ItemVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("front")
@RequiredArgsConstructor
public class FrontController {
	
	
	
	private final FrontService fs;
	
	
	
	///////////////////////물품 관리 
	@GetMapping("articleManage")
	public String articleManage() {
		
//		List<ItemVo>itemList = fs.itemList(paramMap);
//		
//		System.out.println(paramMap);
//		
//		model.addAttribute("itemList", itemList);
		return "front/articleManage";
	}
	////////////////////////////////
	@GetMapping("articleManage/getItemList")
	@ResponseBody
	public List<ItemVo> getItemList( Model model ,@RequestParam Map<String, String> paramMap) {
		
		List<ItemVo>getItemList = fs.getItemList(paramMap);
		
		return getItemList;
	}
	
	//물품 수정
	@GetMapping("articleManage/edit")
	@ResponseBody
	public int edit(@RequestParam Map<String,String>paramMap) {
		
		int result = fs.edit(paramMap);
		
		return result;
	}
	
	
	/////////////////////////////매출관리 
	@GetMapping("sales")
	public String sales(Model model) {
		
		List<DaySalesVo>dayVo = fs.getDaySales();
		
		
		model.addAttribute("dayVo",dayVo);
		
		return"front/sales";
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
		
		System.out.println(paramMap);
		
		List<String> salesList = fs.getMonthSales(paramMap);
		
		
		Map<String ,Object> salesMap = new HashMap<String,Object>();
		salesMap.put("salesList", salesList);
		salesMap.put("months", months);
		salesMap.put("years", years);
		
		System.out.println(salesMap);
		
		
		return salesMap ;
	}
	
	
	/////////////////////////////객실 비품관리 
	@GetMapping("productManage")
	public String prductManage() {
		return"front/productManage";
	}
	
}
