<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>로그인 후 메인 화면 </title>
	<link rel="stylesheet" href="${root}/resources/css/common/home.css">
</head>
<body>
	<div id="wrap">

		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/aside.jsp" %>

		<main>
			<div class="main-container">
				<aside class="main-aside">
					<div class="profile-box"></div>
					<div class="main-aside-empty"></div>
					<div class="team-menu-bar"></div>
				</aside>
				<div class="main-content-list">
					<div class="commute"></div>
					<div class="calendar"></div>
					<div class="mail"></div>
					<div class="board"></div>
				</div>
			</div>
		</main>



	</div>




</body>
</html>