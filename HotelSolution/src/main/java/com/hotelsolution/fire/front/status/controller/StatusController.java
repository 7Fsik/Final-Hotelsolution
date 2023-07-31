package com.hotelsolution.fire.front.status.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.front.status.service.StatusService;
import com.hotelsolution.fire.front.status.vo.StatusVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("front/status")
public class StatusController {
	
	private final StatusService ss;
	
	
	//////////////////////////객실 상태관리 
	@GetMapping("list")
	public String roomStatusList( @RequestParam(value = "page",defaultValue = "1") int page, String searchType ,String searchValue,String checkSelect, Model model) {
		
		int listCount = ss.getRoomCnt();
		int currentPage = page ;
		int pageLimit = 5 ;
		int boardLimit= 8 ;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<StatusVo>svList = ss.list(pv,searchType,searchValue,checkSelect);
		model.addAttribute("pv", pv);
		model.addAttribute("svList", svList);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		
		return "front/status/list";
	}
	
	//객실 상태 상세조회
	@GetMapping("detail")
	public String roomStatusDetail(int no,Model model) {
		
		StatusVo sv = ss.getRoomByNo(no);
		model.addAttribute("sv", sv);
		
		return "front/status/detail";
	}
	//////////////////////////////////////
	
	
	//객실 상태 수정
	@PostMapping("edit")
	public String roomStatusEdit(String roomIntNo , String introduce , String statusNo ,
			@RequestParam("img") MultipartFile img , HttpServletRequest req) {
		
			StatusVo vo = new StatusVo();
		
			if(img != null && !img.isEmpty()) {
				String savePath = req.getServletContext().getRealPath("/resources/img/front/");
				MultipartFile file = img ;
				String eimg = img.getOriginalFilename();
				String ext = eimg.substring(eimg.lastIndexOf("."));
				String imgName = UUID.randomUUID().toString()+ext;
				String path = savePath + imgName;
				File target = new File(path);
				try {
					file.transferTo(target);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				vo.setImg(imgName);
				
			}
			vo.setRoomIntNo(roomIntNo);
			vo.setIntroduce(introduce);
			vo.setStatusNo(statusNo);
			
			
			
	        // 나머지 수정 로직 실행
	        int result = ss.roomStatusEdit(vo);

	        if (result != 1) {
	            throw new RuntimeException("상세조회 하다가 에러");
	        }

	        return "redirect:/front/status/list"; 
	    
	}

}
