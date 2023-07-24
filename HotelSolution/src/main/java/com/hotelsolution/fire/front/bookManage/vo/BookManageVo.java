package com.hotelsolution.fire.front.bookManage.vo;

import lombok.Data;

@Data
public class BookManageVo {

	// 예약리스트
	private String no;
	private String guestNo;
	private String roomIntNo;
	private String bookDate;
	private String startDate;
	private String endDate;
	private String userNo;
	private String price;
	
	//객실정보들

	private String typeNo;
	private String statusNo;
	private String introduce;
	private String roomNo;
	private String img;
	private String typeName;
	
	//손님 정보들
	private String name;
	private String phoneNumber;
	private String gender;
	private String age;
	private String nationallity;
	
	
}
