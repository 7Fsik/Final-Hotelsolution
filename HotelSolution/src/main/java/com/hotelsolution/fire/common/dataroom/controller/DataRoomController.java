package com.hotelsolution.fire.common.dataroom.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	private final DataRoomService service;
	
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
	public String write(Model model, DataRoomVo drvo,
			@RequestParam(value = "fileExplain", required = false) List<String> fileExplain,
			@RequestParam("files") List<MultipartFile> fList, HttpServletRequest req ) throws Exception, IOException {
		String savePath = req.getServletContext().getRealPath("/resources/upload/dataroom/file/");
		int result = 0 ;
		List<DataRoomFileVo> drfvoList = new ArrayList<DataRoomFileVo>(); // 이 위치로 이동
		HttpSession session = req.getSession();
	    MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
//	    String loginMemberNo = "1"; // 실행위에 임시코드
//	    if(loginMember!=null) {
//	    	loginMemberNo = loginMember.getNo();
//	    }//임시코드
	    drvo.setWriterNo(loginMember.getNo());
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
		
		return "redirect:/dataroom/list?categoryNo=" + drvo.getCategoryNo();
		
	}
	
	
	
	//no 는 카테고리로 공용은 0 부서별은 본인 부서번호 개인은100
	@GetMapping("list")
	public void list(Model model,String categoryNo, String dataRoomListPage, HttpServletRequest req,String searchType, String searchValue) {
		HttpSession session = req.getSession();
	    MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
	    model.addAttribute("loginMember", loginMember);
		//초기 카테고리는 개인으로
		if(categoryNo == null) {
			categoryNo = "0";
		}
		//자료실 카운트
		int listCount = service.getDataRoomCnt(categoryNo);
		if(dataRoomListPage == null) {
			dataRoomListPage = "1";
		}
		int currentPage = Integer.parseInt(dataRoomListPage);
		
		int boardLimit = 10;
		int pageLimit = 5;
//		int temp = (listCount-1)/boardLimit +1;
//		if(temp<5) {
//			pageLimit = temp;
//		}else {
//			pageLimit=5;
//		}
		PageVo dataRoomListPv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		Map<String,Object> map = new HashMap();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		map.put("dataRoomListPv", dataRoomListPv);
		map.put("categoryNo" , categoryNo);
		model.addAttribute("searchMap",map);
		List<DataRoomVo> dataVoList = service.getDataRoomList(map); 
		if(dataVoList ==null) {
			dataVoList.get(0).setCategoryName("개인"); 
			}
		map.put("dataVoList" , dataVoList);
		model.addAttribute("map" , map);
	}
	
	//list에서 하나 클릭시 디테일로
	@GetMapping("detail")
	public void detail(Model model,String drvoNo) {
		
		DataRoomVo drvo = service.getDetailDrvo(drvoNo);
		List<DataRoomFileVo> drfvoList = service.getDetailDrfvoList(drvoNo);
		model.addAttribute("drvo",drvo);
		model.addAttribute("drfvoList",drfvoList);
	}
	
	//리
	@GetMapping("download")
	public ResponseEntity<ByteArrayResource> download(HttpServletRequest req, String changeName, String fileName) throws Exception {
		
		//파일 객체 준비
		String root = req.getServletContext().getRealPath("/resources/upload/dataroom/file/");
		String path = root + changeName;
		File target = new File(path);
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource x = new ByteArrayResource(data);
		
		
		return ResponseEntity
				.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(target.length())
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename="+fileName)
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.body(x)
				;
	}


}


