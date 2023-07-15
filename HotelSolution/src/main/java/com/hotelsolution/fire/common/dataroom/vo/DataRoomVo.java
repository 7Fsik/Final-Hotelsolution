package com.hotelsolution.fire.common.dataroom.vo;

import lombok.Data;

@Data
public class DataRoomVo {

	private String dataNo;
	private String writerNo;
	private String categoryNo;
	private String securityLevel;
	private String title;
	private String content;
	private String enrollDate;
	private String hit;
	private String deleteYn;
}
