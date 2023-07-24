package com.hotelsolution.fire.front.bookManage.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.bookManage.service.BookManageService;
import com.hotelsolution.fire.front.bookManage.vo.BookManageVo;
import com.hotelsolution.fire.front.status.vo.StatusVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("front/bookManage")
@RequiredArgsConstructor
public class BookManageController {
	
	private final BookManageService bs ;
	
	
	////////////////////////객실 예약관리 
	@GetMapping("list")
	public String bookManage(int page , Model model, String searchType ,String searchValue) {
		
		int listCount = bs.getBookCnt();
		int currentPage = page ;
		int pageLimit = 5 ;
		int boardLimit= 8 ;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		
		
		List<BookManageVo>bmList = bs.list(pv,searchType,searchValue);
		
		System.out.println(bmList);
		model.addAttribute("pv", pv);
		model.addAttribute("bmList", bmList);
		
		
	return "front/bookManage/list";
	}
	
	@GetMapping("detail")
	public String bookManageDetail(int no,Model model) {
		BookManageVo vo = bs.getBookByNo(no);
		model.addAttribute("vo", vo);
		
	return "front/bookManage/detail";
	}
	///////////////////////////////////

}
