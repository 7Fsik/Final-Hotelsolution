package com.hotelsolution.fire.front.status.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class StatusVo {
	
	//INT
	private String roomIntNo;
	private String typeNo;
	private String statusNo;
	private String introduce;
	private String roomNo;
	private String img;
	
	//type
	private String typeName;
	private String commonPrice;
	private String commonPerson;
	private String maxPerson;
	private String roomSize;
	
	//status
	
	private String status;
	

}
