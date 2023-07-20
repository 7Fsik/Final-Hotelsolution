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
				<%@ include file="/WEB-INF/views/common/mainaside.jsp"%>
				<div class="main-content-list">
					<div class="commute"></div>
					<div class="calendar"></div>
					<div class="mail">
						<div class="mail-container">
							<div class="mail-box">
								<h1>메일함</h1>
								<nav class="nav-bar">
									<span class="active">받은메일함</span>
									<span>안읽은 메일함</span>
									<span>보낸 메일함</span>
								</nav>
								<hr>

								<!-- Table for Received Mailbox -->
								<table class="mail-table">
									<thead>
									<tr>
										<th>메일함</th>
										<th>작성자</th>
										<th>메일내용</th>
									</tr>
									</thead>
									<tbody>
									<!-- You can add temporary data here using JSTL later -->
									<!-- Example row: -->
									<tr>
										<td>받은메일함</td>
										<td>John Doe</td>
										<td>Hello, this is a sample email in the Received Mailbox.</td>
									</tr>
									<!-- Add more rows for the Received Mailbox as needed -->
									</tbody>
								</table>

								<!-- Add more mail sections (tables) for "안읽은메일함" and "보낸메일함" here -->
							</div>
						</div>
					</div>


					<div class="board"></div>
				</div>
			</div>
		</main>



	</div>




</body>
</html>