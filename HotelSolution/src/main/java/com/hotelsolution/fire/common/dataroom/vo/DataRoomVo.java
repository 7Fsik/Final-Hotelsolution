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
	//추가
	private String writerName;//user조인
	private String writerTeam;//user조인
	private String firstFile;//dataroom_file조인
	private String categoryName;//DATAROOM_CATEGORY 조인
	private String fileCnt;//DATAROOM_CATEGORY 조인
	private String securityLevelName;//DATAROOM_CATEGORY 조인
}
