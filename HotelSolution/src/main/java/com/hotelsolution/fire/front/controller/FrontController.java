package com.hotelsolution.fire.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("front")
public class FrontController {
	
	
	
	
	/////////////////////////////객실 이용관리
	@GetMapping("useManage/list")
	public String useManageList() {
		return "front/useManage/list";
	}
	@GetMapping("useManage/detail")
	public String useManageDetail() {
		return "front/useManage/detail";
	}
	////////////////////////////////
	
	
	///////////////////////물품 관리 
	@GetMapping("articleManage")
	public String articleManage() {
		return "front/articleManage";
	}
	////////////////////////////////
	
	
	/////////////////////////////매출관리 
	@GetMapping("sales")
	public String sales() {
		return"front/sales";
	}
	
	
}
