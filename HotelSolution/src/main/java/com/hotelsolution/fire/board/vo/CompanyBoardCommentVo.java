package com.hotelsolution.fire.board.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CompanyBoardCommentVo {

    private int commentNo;
    private int boardNo;
    private String writerNo;
    private String writerName;
    private String commentContent;
    private LocalDateTime enrollDate;
    private String status;
    private int parentCommentNo;
    private int commentDepth;
    private int commentGroupNo;




}
