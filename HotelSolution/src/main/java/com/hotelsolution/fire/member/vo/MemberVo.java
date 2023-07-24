package com.hotelsolution.fire.member.vo;

import lombok.Data;

@Data
public class MemberVo {
   private String no;
   private String teamNo;
   private String positionNo;
   private String id;
   private String password;
   private String name;
   private String email;
   private String enrollDate;
   private String status;
   private String contrackWorkTime;
   private String contrackWorkEndTime;
   private String salary;
   private String image;
   private String changeImage;
   //추가 
   private String teamName;
   private String positionName;
   private String teamAddress;
   
   
}