package com.hotelsolution.fire.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("front")
public class FrontController {
	
	@GetMapping("bookManage/list")
	public String bookManage() {
		return "front/bookManage/list";
	}
	
	@GetMapping("bookManage/detail")
	public String bookManagedetail() {
		return "front/bookManage/detail";
	}

}
