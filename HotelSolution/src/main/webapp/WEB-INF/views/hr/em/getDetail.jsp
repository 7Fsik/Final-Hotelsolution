<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.detailWrap{
		width: 1400px;
		height:860px;
		border: 1px solid black;
		border-radius: 20px;
		display:grid;
		grid-template-rows : 1fr 2fr;
	}
	
	
	
	.detailBody{
		display: grid;
		grid-template-columns : 1fr 1fr;
	}
	.detailBodyLeft{
		width: 550px;
		height:470px;
		margin: auto; 
		border: 1px solid black;
		border-radius: 20px;
		
	}
	
	.detailBodyRight{
		width: 550px;
		height:470px;
		margin: auto; 
		border: 1px solid black;
		border-radius: 20px;
		
	}
	.detailTable{
		width: 1260px;
		height:230px;
		margin: auto;
		border-collapse: separate;
        border-spacing: 0;
		margin-top: 40px;
	}
	
        th, td {
            border: 1px solid black;
        }
</style>
</head>
<body>
	<div class="detailWrap">
		
		<div class="detailTop">
			<table class="detailTable">
				<tr>
					<td rowspan="4">${vo.image}</td>
					<td>이름</td>
					<td>소속 : ${vo.teamName}</td>
					<td>사번 : ${vo.no}</td>
				</tr>
				<tr>
					<td rowspan="3">${vo.name}</td>
					<td style="width: 350px">가입일 : ${vo.enrollDate}</td>
					<td >이메일 : ${vo.email}</td>
				</tr>
				<tr>
					<td style="width: 350px">연봉 : ${vo.salary}</td>
					<td >휴대폰번호 : 0${vo.id}</td>
				</tr>
				<tr>
					<td style="width: 350px">직책 : ${vo.positionName}</td>
					<td >부서전화번호 : ${vo.teamAddress}</td>
				</tr>
				
			</table>
		</div>
		
		<div class="detailBody">
			<div class="detailBodyLeft">
				근태관리
			</div>
			
			<div class="detailBodyRight">
				휴가내역
			</div>
		</div>
			
		
		
	</div>
	
	
</body>
</html>