package com.hotelsolution.fire.board.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CompanyBoardCommentVo {

    private int commentNo;
    private int boardNo;
    private String writer;
    private String commentContent;
    private LocalDateTime enrollDate;
    private String status;
    private int parentComment_no ;
    private int commentDepth;
    private int commentGroupNo;



}
