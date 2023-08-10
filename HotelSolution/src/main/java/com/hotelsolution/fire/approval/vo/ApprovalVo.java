package com.hotelsolution.fire.approval.vo;

import lombok.Data;

@Data
//결재문서 vo
public class ApprovalVo {

	private String no;
	private String typeNo;
	private String userNo;
	private String title;
	private String content;
	private String adYn;
	private String enrollDate;
	private String endDate;
	private String documentTypeName;
	private String statusName;
	private String positionName;
	private String teamName;
	private String sendName;
	private String vacationStart;
	private String vacationEnd;
	private String writerName;
	
	
}
