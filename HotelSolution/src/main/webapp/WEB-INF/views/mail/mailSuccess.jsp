<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>메일함</title>
  <link rel="stylesheet" href="${root}/resources/css/mail/success.css">
  <script defer src="${root}/resources/js/mail/success.js"></script>
  <style>

  </style>
</head>

<body>

<div id="wrap">

  <%@ include file="/WEB-INF/views/common/main.jsp" %>

  <div id="mainboard">

      <div class="main-content">
        <div class="mail-success-container">
          <h1 style="font-weight: bold">메일이 저장되었습니다</h1>
          <br>
          <h2 style="font-weight: bold">보낸메일은 메일함에서 확인할 수 있습니다</h2>
          <br>
          <div class="mail-success-btn-list">
            <button class="send-mail-btn" id="SendmailBtn" data-root="${root}">보낸메일함</button>
            <button class="mail-write-btn" id="mailWriteBtn" data-root="${root}">메일쓰기</button>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>

</body>
</html>
