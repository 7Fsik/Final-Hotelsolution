package com.hotelsolution.fire.front.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelsolution.fire.front.service.FrontService;
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
		
		System.out.println(paramMap);
		
		return getItemList;
	}
	
	
	/////////////////////////////매출관리 
	@GetMapping("sales")
	public String sales() {
		return"front/sales";
	}
	
	
	/////////////////////////////객실 비품관리 
	@GetMapping("productManage")
	public String prductManage() {
		return"front/productManage";
	}
	
}
