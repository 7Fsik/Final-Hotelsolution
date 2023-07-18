<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>사내게시판 목록조회합시다</title>
  <link rel="stylesheet" href="${root}/resources/css/companyboard/detail.css">
  <script defer src="${root}/resources/js/companyboard/detail.js"></script>
</head>

<body>

<div id="wrap">

  <%@ include file="/WEB-INF/views/common/header.jsp" %>
  <%@ include file="/WEB-INF/views/common/aside.jsp" %>

  <main>
    <div class="main-container">
      
      <%@ include file="/WEB-INF/views/common/mainaside.jsp"%>

      <div>아무거나넣기</div>
    </div>
  </main>

</div>

</body>
</html>