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
}
