package com.hotelsolution.fire.board.vo;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class CompanyBoardVo {

    private int no;
    private String categoryNo;
    private String writerNo;
    private String title;
    private String content;
    private LocalDateTime enrollDate;
    private int hit;
    private String status;
    private String writerName;
}
