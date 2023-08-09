package com.hotelsolution.fire.restaurant.table.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.restaurant.table.service.TableService;
import com.hotelsolution.fire.restaurant.table.vo.TableIntVo;
import com.hotelsolution.fire.restaurant.table.vo.TablePrice;
import com.hotelsolution.fire.restaurant.vo.MenuVo;
import com.hotelsolution.fire.restaurant.table.vo.TableBookVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("restaurant/table")
@RequiredArgsConstructor
public class TableController {
	
	private final TableService ts;
	
	
	///////////////////////// 식당 테이블
	@GetMapping("pos")
	public String table(Model model) {
		
		//메뉴 , 테이블 번호
//		List <MenuVo> menuList = ts.getMenu();
//		model.addAttribute("menuList", menuList);
		
		List<TableIntVo>tableList = ts.getRoomInt();
		model.addAttribute("vo", tableList);
		
	return "restaurant/table/pos";
	}
	
	//메뉴 주문하기 
	@GetMapping("posMenu")
	public String posMenu(@RequestParam("no") String no,Model model) {
		
		// 현재 날짜 구하기
        LocalDate currentDate = LocalDate.now();
        // 다음 날짜 구하기
        LocalDate nextDate = currentDate.plusDays(1);

        // 날짜와 시간을 합치기
        LocalDateTime currentDateTime = LocalDateTime.of(currentDate, LocalTime.of(0, 0, 0));
        LocalDateTime nextDateTime = LocalDateTime.of(nextDate, LocalTime.of(0, 0, 0));

        // 날짜와 시간을 원하는 형식으로 포맷팅
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String startDateTime = currentDateTime.format(formatter);
        String endDateTime = nextDateTime.format(formatter);

	    Map<String, String> date = new HashMap<>();
	    date.put("startDateTime", startDateTime);
	    date.put("endDateTime", endDateTime);
	    date.put("no", no);
	    
	    System.out.println(date);
		
		List <MenuVo> menuList = ts.getMenu();
		TableBookVo vo = ts.getUse(date);
		
		System.out.println(vo);
		
		if(vo==null) {
			return "redirect:/restaurant/table/pos";
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("menuList", menuList);
		
		return "restaurant/table/posMenu";
	}
	
	@PostMapping("payment")
	@ResponseBody
	public int payment(String useNo) {
		
		int result = ts.payment(useNo);
		
		return result ;
	}
	
	
	@PostMapping("posOrder")
	@ResponseBody
	public int posOrder(String str) {
		
		Gson gson = new Gson();
		Map paramMap = gson.fromJson(str, Map.class);
		
		List <String> menuList = (List<String>) paramMap.get("menuNo");
		String useNo = (String) paramMap.get("useNo");
		String totalPrice = (String) paramMap.get("totalPrice");
		
		Map<String,String>price = new HashMap<>();
		price.put("totalPrice", totalPrice);
		price.put("useNo", useNo);
		
		Map<String , Object> posOrderMap = new HashMap<>() ;
		posOrderMap.put("menuList", menuList);
		posOrderMap.put("useNo", useNo);
		
		System.out.println(posOrderMap);
		
		
		int result = ts.posOrder(posOrderMap);
		int result2 = ts.totalPrice(price);
		
		
		return result ;
	}
	
	
	@PostMapping("getTotalPrice")
	@ResponseBody
	public List<TablePrice> getTotalPrice(){
		
		 // 현재 날짜 구하기
        LocalDate currentDate = LocalDate.now();
        // 다음 날짜 구하기
        LocalDate nextDate = currentDate.plusDays(1);

        // 날짜와 시간을 합치기
        LocalDateTime currentDateTime = LocalDateTime.of(currentDate, LocalTime.of(0, 0, 0));
        LocalDateTime nextDateTime = LocalDateTime.of(nextDate, LocalTime.of(0, 0, 0));

        // 날짜와 시간을 원하는 형식으로 포맷팅
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String startDateTime = currentDateTime.format(formatter);
        String endDateTime = nextDateTime.format(formatter);

	    Map<String, String> date = new HashMap<>();
	    date.put("startDateTime", startDateTime);
	    date.put("endDateTime", endDateTime);
	    
		
		List<TablePrice> priceList = ts.getTotalPrice(date);
		
		return priceList;
	}
	
	
	
	
	
	/////////////////////////////
	
	/////////////////////////식당 이용예약
	@GetMapping("useBook")
	public String useBook(Model model) {
		
		List<TableIntVo>tableList = ts.getRoomInt();
		
		model.addAttribute("vo", tableList);
		
		return"restaurant/table/useBook";
	}
	
	@PostMapping("getBook")
	@ResponseBody
	public List<TableBookVo> getBook(String day){

	    LocalDate localDate = LocalDate.parse(day);
	    LocalDate currentDate = LocalDate.now();

	    LocalDateTime startDateTime;
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	    if (localDate.equals(currentDate)) {
	        // 오늘인 경우: 현재 시간을 사용하여 LocalDateTime 생성
	        LocalTime currentTime = LocalTime.now();
	        startDateTime = localDate.atTime(currentTime);
	    } else {
	        // 오늘이 아닌 경우: 00:00:00으로 시작하는 LocalDateTime 생성
	        startDateTime = localDate.atStartOfDay();
	    }

	    // 값을 YYYY-MM-DD HH24:MI:SS 로 만듬
	    LocalDateTime endDateTime = startDateTime.plusDays(1);

	    Map<String, LocalDateTime> date = new HashMap<>();
	    date.put("startDateTime", startDateTime);
	    date.put("endDateTime", endDateTime);
	        
	    List<TableBookVo> bookList = ts.getBook(date);

	    return bookList; 
	}
	//확인
	@PostMapping("checkOk")
	@ResponseBody
	public int checkOk(String no) {
		
		int result = ts.checkOk(no);
		
		return result;
	}
	//취소
	@PostMapping("cancel")
	@ResponseBody
	public int cancel(String num) {
		
		int result = ts.cancel(num);
		
		return result;
	}
	
	//바로 이용
	@PostMapping("useBook")
	@ResponseBody
	public int useBook(@RequestParam Map<String,String> useMap,HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
    	String no = loginMember.getNo();
    	
    	useMap.put("memberNo", no);
		
		int result =ts.useBook(useMap); 
		
		return result;
	}
	//예약
	@PostMapping("book")
	@ResponseBody
	public int book(@RequestParam Map<String,String> bookMap,HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		//날짜와 시간 합치기 
		 LocalDate localDate = LocalDate.parse(bookMap.get("date"));
        LocalTime localTime = LocalTime.parse(bookMap.get("bookTime"));
        LocalDateTime localDateTime = localDate.atTime(localTime);

        // 원하는 형식으로 포맷팅
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String bookDate = localDateTime.format(formatter);
        
		
		bookMap.put("bookDate",bookDate);
		bookMap.put("memberNo", no);
		
		
		int result =ts.book(bookMap); 
		
		return result;
	}
	
	
	////////////////////////////////////
	
	

}
