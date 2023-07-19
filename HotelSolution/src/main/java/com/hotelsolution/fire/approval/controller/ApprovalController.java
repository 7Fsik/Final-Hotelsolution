package com.hotelsolution.fire.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("approval")
@RequiredArgsConstructor
public class ApprovalController {

	//결재 첫화면
	@GetMapping("approvalFirstPage")
	public void approval() {
		
	}
	
	//내가받은결재(화면)
	@GetMapping("getApproval")
	public void getApproval() {
		
	}
	
	//삭제된 결재(화면)
	@GetMapping("deleteApproval")
	public void deleteApproval() {
		
	}
	
	//참조받은결재(화면)
	@GetMapping("referrerApproval")
	public void referrerApproval() {
		
	}
	
	//휴가신청서(화면)
	@GetMapping("vaction")
	public void vaction() {
		
	}
	
	//업무보고서(화면)
	@GetMapping("report")
	public void report() {
		
	}
	
	//지출결의서(화면)
	@GetMapping("expenditure")
	public void expenditure() {
		
	}
	
	
	
}//class
