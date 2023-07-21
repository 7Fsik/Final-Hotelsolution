<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>메일함 상세보기</title>
  <link rel="stylesheet" href="${root}/resources/css/mail/detail.css">
  <script defer src="${root}/resources/js/mail/detail.js"></script>
  <style>

  </style>
</head>

<body>

<div id="wrap">

  <%@ include file="/WEB-INF/views/common/main.jsp" %>

      <div id="mainboard">
        <div class="mail-detail-container">
          <h1 class="receive-mail-count">받은 메일함 19734/20158</h1>
          <nav class="mail-reply-bar">
            <span>답장</span>
            <span>전체답장</span>
            <span>전달</span>
            <span>삭제</span>
            <span>목록</span>
          </nav>
          <div class="mail-contact-area">
            <div class="mail-contact-container">
              <div class="sender">
                 <span>
                   보낸사람
                </span>
                  <span>
                  홍길동 대리님 <010123456789@naver.com>
                </span>
              </div>
              <div class="receiver">
                <span>
                   보낸사람
                </span>
                <span>
                김미영 팀장님 <010123456759@naver.com>
                </span>
              </div>
              <div class="cc">
               <span>
                 참조
               </span>
                <span>
                홍길동 대리님 <010123456789@naver.com>
              </span>
              </div>
              <div>
                2023년 7월 19일 (수) 오후 3:06
              </div>
              <div class="mail-horizion"> </div>
            </div>
            </div>
            <hr class="main-detail-horizon-line">
            <div class="mail-detail-area">
              <label class="mail-detail-input-label">
                <textarea class="mail-detail-input"></textarea>
              </label>
            </div>
      </div>
    </div>
</div>

</body>
</html>
