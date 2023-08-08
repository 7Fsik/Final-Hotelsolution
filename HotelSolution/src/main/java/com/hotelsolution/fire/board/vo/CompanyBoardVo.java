package com.hotelsolution.fire.board.vo;

import com.hotelsolution.fire.common.util.DateUtil;
import lombok.Data;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.util.Date;

@Data
public class CompanyBoardVo {

    private int no; //게시글번호
    private String categoryNo; //게시글카테고리번호
    private String writerNo; //작성자번호
    private String title;
    private String content;
    private ZonedDateTime enrollDate;
    private int hit;
    private String status;
    private String writerName;
    private String teamName;
    private String commentCount;
    private String elapsedSinceEnrollDate;

    public String getElapsedSinceEnrollDate() {
        return DateUtil.getElapsedSince(enrollDate);
    }
}
