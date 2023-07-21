<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>메일쓰기화면</title>
  <link rel="stylesheet" href="${root}/resources/css/mail/post.css">
  <script defer src="${root}/resources/js/mail/post.js"></script>
  <style>

  </style>
</head>

<body>

<div id="wrap">

  <%@ include file="/WEB-INF/views/common/main.jsp" %>

  <div id="mainboard">
    <div class="main-container">

      <div class="main-content">

        <hr class="mail-horizion">
        <div class="mail-write-container">
          <div class="write-btn">
            <button onclick="goWriteMailBtn();">보내기 </button>
          </div>
          <div class="receiver">
            <label> 받는사람
              <input class="MailCatcher" type="text" name="mailReceiverNo">
            </label>
            <button onclick="goContract();">주소록 </button>
          </div>
          <div class="cc">
            <label> 참조
              <input class="mailCc" type="text" name="mailCcNo">
            </label>
          </div>
          <div class="mail-title">
            <label> 제목
              <input type="text" name="mail-title">
            </label>
          </div>
          <div class="mail-file-btn">
            <input type="file" accept="image/*,.txt" multiple required capture='user' onchange='aaa'/>          </div>
          <div class="file-list">
          </div>
          <div class="mail-write-content">
            <label> 내용
              <textarea class="mail-write-area"></textarea>
            </label>
          </div>



        </div>
      </div>
    </div>
  </main>
</div>

</body>
</html>
