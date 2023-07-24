package com.hotelsolution.fire.front.useBook.vo;

import lombok.Data;

@Data
public class UseBookVo {

	//객실 정보들 
	private String roomIntNo;
	private String typeNo;
	private String statusNo;
	private String introduce;
	private String roomNo;
	private String img;
	
	private String typeName;
	private String commonPrice;
	private String commonPerson;
	private String maxPerson;
	private String roomSize;
	
	//객실 예약정보
	private String totalPrice;
	
	
}
