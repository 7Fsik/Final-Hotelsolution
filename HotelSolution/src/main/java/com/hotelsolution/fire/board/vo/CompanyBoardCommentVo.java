package com.hotelsolution.fire.board.vo;

import com.hotelsolution.fire.common.util.DateUtil;
import lombok.Data;

import java.time.LocalDateTime;
import java.time.ZonedDateTime;

@Data
public class CompanyBoardCommentVo {

    private int commentNo;
    private int boardNo;
    private String writerNo;
    private String writerName;
    private String commentContent;
    private ZonedDateTime enrollDate;
    private String status;
    private int parentCommentNo;
    private int commentDepth;
    private int commentGroupNo;
    private String elapsedSinceEnrollDate; // 새로운 멤버 변수 추가

    public void setElapsedSinceEnrollDate() {
        this.elapsedSinceEnrollDate = DateUtil.getElapsedSince(enrollDate);
    }


}
