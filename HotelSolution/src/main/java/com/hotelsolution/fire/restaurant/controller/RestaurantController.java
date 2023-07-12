package com.hotelsolution.fire.restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("restaurant")
public class RestaurantController {
	
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
	
	
}//class
