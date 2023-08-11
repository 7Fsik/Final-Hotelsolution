package com.hotelsolution.fire.finance.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.finance.service.FinanceService;
import com.hotelsolution.fire.finance.vo.FrontVo;
import com.hotelsolution.fire.finance.vo.RestaurantVo;
import com.hotelsolution.fire.front.vo.DaySalesVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("finance")
@RequiredArgsConstructor
public class FinanceController {

	private final FinanceService fs;
	
	
	@GetMapping("sales")
	public String sales(Model model) {
		
		List<FrontVo>fdayVo = fs.fgetDaySales();
		List<RestaurantVo>rdayVo = fs.rgetDaySales();
		
		
		
		model.addAttribute("fdayVo",fdayVo);
		
		
		model.addAttribute("rdayVo",rdayVo);
		
		
		return "finance/sales";		
	}
	
	
	
}
