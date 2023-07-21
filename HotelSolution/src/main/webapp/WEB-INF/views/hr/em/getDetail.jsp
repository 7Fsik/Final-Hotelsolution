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
		background-color:white;
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
	
       .dttd {
       		padding-left:20px;
       		padding-top:20px;
            border: 1px solid black;
        }
</style>
</head>
<body>
	<div id ="wrap">

	   <%@ include file="/WEB-INF/views/common/main.jsp" %>
	
	   <div id="mainboard">
	
	      	<div class="detailWrap">
		
				<div class="detailTop">
					<table class="detailTable">
						<tr>
							<td rowspan="4" style="text-align: center; border: 1px solid black;">${vo.image}</td>
							<td class="" style="text-align: center; border: 1px solid black;">이름</td>
							<td class="dttd">소속 : ${vo.teamName}</td>
							<td class="dttd">사번 : ${vo.no}</td>
						</tr>
						<tr>
							<td rowspan="3" style="text-align: center; border: 1px solid black;">${vo.name}</td>
							<td style="width: 350px" class="dttd">가입일 : ${vo.enrollDate}</td>
							<td class="dttd">이메일 : ${vo.email}</td>
						</tr>
						<tr>
							<td style="width: 350px" class="dttd">연봉 : ${vo.salary}원</td>
							<td class="dttd">휴대폰번호 : 0${vo.id}</td>
						</tr>
						<tr>
							<td style="width: 350px" class="dttd">직책 : ${vo.positionName}</td>
							<td class="dttd">부서전화번호 : ${vo.teamAddress}</td>
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
	
	   
	   </div>
	
	</div>
	
	
</body>
</html>