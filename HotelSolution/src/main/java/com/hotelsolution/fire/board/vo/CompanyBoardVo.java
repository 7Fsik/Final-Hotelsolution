package com.hotelsolution.fire.board.vo;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class CompanyBoardVo {

    private int no; //게시글번호
    private String categoryNo; //게시글카테고리번호
    private String writerNo; //작성자번호
    private String title;
    private String content;
    private LocalDateTime enrollDate;
    private int hit;
    private String status;
    private String writerName;
    private String teamName;
}
