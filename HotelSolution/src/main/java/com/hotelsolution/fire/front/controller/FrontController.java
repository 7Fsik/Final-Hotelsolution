package com.hotelsolution.fire.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("front")
public class FrontController {
	////////////////////////객실 예약관리 
	@GetMapping("bookManage/list")
	public String bookManage() {
		return "front/bookManage/list";
	}
	
	@GetMapping("bookManage/detail")
	public String bookManageDetail() {
		return "front/bookManage/detail";
	}
	///////////////////////////////////
	
	//////////////////////////객실 상태관리 
	@GetMapping("roomStatus/list")
	public String roomStatusList() {
		return "front/roomStatus/list";
	}
	@GetMapping("roomStatus/detail")
	public String roomStatusDetail() {
		return "front/roomStatus/detail";
	}
	//////////////////////////////////////
	
	
	///////////////////////////////객실 이용 / 예약 관리 
	@GetMapping("useBook/list")
	public String useBookList() {
		return "front/useBook/list";
	}
	@GetMapping("useBook/detail")
	public String useBookDetail() {
		return "front/useBook/detail";
	}
	//////////////////////////////////////
	
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
	
	
	
}
