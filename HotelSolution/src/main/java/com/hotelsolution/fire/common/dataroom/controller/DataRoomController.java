package com.hotelsolution.fire.common.dataroom.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotelsolution.fire.common.dataroom.service.DataRoomService;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomFileVo;
import com.hotelsolution.fire.common.dataroom.vo.DataRoomVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("dataroom")
@Slf4j
public class DataRoomController {
	public final DataRoomService service;
	
	//작성하기 클릭시 작성하는 화면
	@GetMapping("write")
	public void write(Model model,HttpServletRequest req, String categoryNo) {
		
	    HttpSession session = req.getSession();
	    MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
	    model.addAttribute("loginMember", loginMember);
	    model.addAttribute("categoryNo",categoryNo);
	}
	
	//파일 업로드
	@PostMapping("write")
	public String write(Model model, DataRoomVo drvo, @RequestParam(value = "fileExplain", required = false) List<String> fileExplain,  @RequestParam("files") List<MultipartFile> fList, HttpServletRequest req ) throws Exception, IOException {
		String savePath = req.getServletContext().getRealPath("/resources/upload/dataroom/file/");
		int result = 0 ;
		List<DataRoomFileVo> drfvoList = new ArrayList<DataRoomFileVo>(); // 이 위치로 이동
		HttpSession session = req.getSession();
	    MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
	    String loginMemberNo = loginMember.getNo();
	    drvo.setWriterNo(loginMemberNo);
	    for (int i = 0; i < fList.size(); i++) {
	    	DataRoomFileVo fileVo = new DataRoomFileVo();
	        drfvoList.add(fileVo);
	        MultipartFile file = fList.get(i);
	        if (!file.isEmpty()) {
	            String originName = file.getOriginalFilename();
	            drfvoList.get(i).setFileName(originName);
	            String ext = originName.substring(originName.lastIndexOf("."));
	            String changeName = UUID.randomUUID().toString() + ext;
	            drfvoList.get(i).setChangeName(changeName);
	            String fileExp = fileExplain.get(i);
	            drfvoList.get(i).setFileExplain(fileExp);
	            String path = savePath + changeName;
	            File target = new File(path);
	            file.transferTo(target);
	        	}
	       
	    	}
	    	result =  service.write(drvo,drfvoList);
	    if(result!=1) {
			throw new RuntimeException("자료를 무조건 추가해야됩니다. 작성 실패");
		}
		
		return "redirect:/dataroom/list";
	}
	
	
	
	//no 는 카테고리로 공용은 0 부서별은 본인 부서번호 개인은100
	@GetMapping("list")
	public void list(Model model,String categoryNo, String listpage) {
		//초기 카테고리는 개인으로
		if(categoryNo == null) {
			categoryNo = "100";
		}
		System.out.println(categoryNo);
		//자료실 카운트
		int listCount = service.getDataRoomCnt(categoryNo);
		if(listpage == null) {
			listpage = "1";
		}
		System.out.println(listCount);
		int currentPage = Integer.parseInt(listpage);
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo dataRoomListPv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
	
		model.addAttribute("dataRoomListPv",dataRoomListPv);
		System.out.println(dataRoomListPv);
		List<DataRoomVo> dataVoList =service.getDataRoomList(categoryNo, dataRoomListPv); 
		model.addAttribute("dataVoList" , dataVoList);
		System.out.println(dataVoList);
	}
	
	@GetMapping("detail")
	public void detail(Model model,String drvoNo) {
		DataRoomVo drvo = service.getDetailDrvo(drvoNo);
		List<DataRoomFileVo> drfvoList = service.getDetailDrfvoList(drvoNo);
		model.addAttribute("drvo",drvo);
		model.addAttribute("drfvoList",drfvoList);
		
	}
	


}


