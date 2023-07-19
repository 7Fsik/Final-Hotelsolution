package com.hotelsolution.fire.member.vo;

import lombok.Data;

@Data
public class MemberVo {
	private String no;
	private String teamNo;
	private String positionNo;
	private String id;
	private String password;
	private String name;
	private String email;
	private String image;
	private String enrollDate;
	private String status;
	private String contrackWorkTime;
	private String contrackWorkEndTime;
	private String salary;
	//추가 
	private String teamName;
	private String positionName;
	
	
}
