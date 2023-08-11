package com.hotelsolution.fire.front.useManage.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.useManage.service.UseManageService;
import com.hotelsolution.fire.front.useManage.vo.FoodOrderVo;
import com.hotelsolution.fire.front.useManage.vo.RoomOrderVo;
import com.hotelsolution.fire.front.useManage.vo.UseManageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("front/useManage")
@RequiredArgsConstructor
public class UseManageController {
	
	private final UseManageService us;
	
	/////////////////////////////객실 이용관리
	@GetMapping("list")
	public String useManageList(@RequestParam(defaultValue = "1") int page, String searchValue,Model model) {
		
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = currentDate.format(formatter);
		
		int listCount = us.getUseCnt(date,searchValue);
		int currentPage = page ;
		int pageLimit = 5 ;
		int boardLimit= 8 ;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<UseManageVo> useList = us.getUseList(pv,date,searchValue);
		
		model.addAttribute("useList", useList);
		model.addAttribute("searchValue", searchValue);
		
		return "front/useManage/list";
	}
	//객실 detail
	@GetMapping("detail")
	public String useManageDetail(int no,Model model) {
		
		UseManageVo vo =us.getUseByNo(no);
		
		model.addAttribute("vo", vo);
		
		return "front/useManage/detail";
	}
	////////////////////////////////
	//결제 
	@PostMapping("payment")
	@ResponseBody
	public int payment(@RequestParam Map<String,String>paramMap) {
		
		int result = us.payment(paramMap);
		
		return result;
	}
	
	
	////////////////////////////////
	
	//객실 비품 내역들
	@GetMapping("roomOrderList")
	@ResponseBody
	public List<RoomOrderVo> roomOrderList(int no) {
		
		List<RoomOrderVo> list = us.roomOrderList(no);
		
		return list;
	}
	//객실 비품 검색
	@GetMapping("roomSearch")
	@ResponseBody
	public List<RoomOrderVo> roomSearch(String searchValue) {
		
		List<RoomOrderVo> list = us.roomSearch(searchValue);
		
		return list;
	}
	
	//객실주문
	@GetMapping("roomOrder")
	@ResponseBody
	public String roomOrder(String str) {
		
		Gson gson = new Gson();
		Map paramMap = gson.fromJson(str, Map.class);
		
		List <String> noList = (List<String>) paramMap.get("no");
		List <String> numList = (List<String>) paramMap.get("num");
		String useNo = (String) paramMap.get("useNo");
		
		Map<String , Object> roomOrderMap = new HashMap<>() ;
		roomOrderMap.put("noList", noList);
		roomOrderMap.put("numList", numList);
		roomOrderMap.put("useNo", useNo);
		
		int result =us.roomOrder(roomOrderMap);
		if(result<1) {
			return "false";
		}
		return "ok";
	}
	
	
	
	
	
	
	
	//음식 주문ㄴ내역
	@GetMapping("foodOrderList")
	@ResponseBody
	public List<FoodOrderVo> foodOrderList(int no) {

		List<FoodOrderVo> list = us.foodOrderList(no);
		
		return list;
	}
	
	//음식 비품 검색
	@GetMapping("foodSearch")
	@ResponseBody
	public List<FoodOrderVo> foodSearch(String searchValue) {
		
		List<FoodOrderVo> list = us.foodSearch(searchValue);
		
		return list;
	}
	
	
	//음식주문
	@GetMapping("foodOrder")
	@ResponseBody
	public String foodOrder(String str) {
		
		Gson gson = new Gson();
		Map paramMap = gson.fromJson(str, Map.class);
		
		List <String> noList = (List<String>) paramMap.get("no");
		List <String> numList = (List<String>) paramMap.get("num");
		String useNo = (String) paramMap.get("useNo");
		
		Map<String , Object> foodOrderMap = new HashMap<>() ;
		foodOrderMap.put("noList", noList);
		foodOrderMap.put("numList", numList);
		foodOrderMap.put("useNo", useNo);
		
		int result =us.foodOrder(foodOrderMap);
		if(result<1) {
			return "false";
		}
		return "ok";
	}
	
	
	
	//비품주문
}
