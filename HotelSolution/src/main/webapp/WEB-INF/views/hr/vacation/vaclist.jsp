<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id ="wrap">

	   <%@ include file="/WEB-INF/views/common/main.jsp" %>
	
	   <div id="mainboard">
	   		<div>휴가 사용 목록</div>
				<table class="detailTable">
						<tr>
							<td rowspan="3" style="text-align: center; border: 1px solid black;">{vo.image}</td>
							<td class="" style="text-align: center; border: 1px solid black;">이름 : vo.name</td>
							<td class="dttd">사번 : {vo.teamName}</td>
							<td class="dttd">소속 : {vo.no}</td>
							<td class="dttd">직책 : {vo.no}</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center; border: 1px solid black;"> 기간 {vo.days}</td>
							<td colspan="2" style="width: 350px" class="dttd">휴대포번호 : {vo.enrollDate}</td>
							<td class="dttd">결재승인 : {vo.email}</td>
						</tr>
						<tr>
							<td style="width: 350px" class="dttd" colspan="4">사유 : {vo.salary}원</td>
						</tr>
						
						
					</table>
		</div>
	</div>
	
</body>
</html>