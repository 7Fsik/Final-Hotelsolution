<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<html>
<head>
  <title>메인에 사이드바</title>

  <link rel="stylesheet" href="${root}/resources/css/common/header.css">

</head>
<body>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<html>
<head>
  <title>Title</title>

  <link rel="stylesheet" href="${root}/resources/css/common/mainaside.css">
</head>
<body>

<aside class="main-aside">
  <div class="profile-box">
    <div class="employee-container">
      <div class="profile-img">
        <img class="header-profile-img-2" src="${root}/resources/img/증명사진.png" alt="채팅이미지">
      </div>
      <div class="employee">
        홍길동 사원
      </div>
      <div class="team">프론트팀</div>
    </div>
    <div class="info-container">
      <div class="myinfo"> 내 정보 수정</div>
      <div class="approval">
        <span> 요청할 결제</span>
        <span class="approval-count"> 3</span>
      </div>
      <div class="vacation">
        <span>남은연차</span>
        <span class="vacation-count">15</span>
      </div>
    </div>
  </div>
  <div class="team-menu-bar">
    <div class="team-title">프론트팀</div>
    <div class="mail-box">
      <div class="sub-menu">
        <div class="sub-menu-title">메일함</div>
        <ul>
          <li><a href="#">보낸메일함</a></li>
          <li><a href="#">받은메일함</a></li>
          <li><a href="#">휴지통</a></li>
        </ul>
      </div>
    </div>
  </div>
</aside>

</body>
</html>
