package com.hotelsolution.fire.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("front")
public class FrontController {
	
	
	
	
	
	
	
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
