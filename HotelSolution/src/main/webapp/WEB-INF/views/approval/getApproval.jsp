<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
    
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"><head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${root}/resources/css/common/home.css">

<style>
    body{
        margin: 0;
        background-color: lightgray;
    }
    #approval{
        border: 1px solid white;
        width: 1200px;
        height: 750px;
        background-color:white;
        margin:auto;
        border-radius:10px;
        margin-top:20px;
    }
    
    #approval a{
    	text-decoration:none;
        color: black;
    }
    
    #approval a:hover{
    	color: rgb(173,180,218);
    }
    
    #approval h1{
    	position:relative;
    	left:60px;
    	margin-top:15px;
    	font-size:1.5em;
    }
    
    hr{
    	border:none;
    	border-top:1px solid lightgray;
    	position:relative;
    }
    
    .approval-menu{
    	display : flex;
    	justify-content:space-between;
    	margin-top:20px;
    }
    
    .approval-list{
    	display:grid;
    	grid-template-columns:2fr 1.3fr 2fr 1fr;
    	text-align:center;
    }
    
    .approval-write{
    	display:grid;
    	grid-template-columns:1fr 2fr 1fr 0.5fr;
    	text-align:center;
    	
    }
    
    .list-title img{
    	width:30px;
    	height:30px;
    	margin-left:30px;
    }
    
    .list{
    	display:flex;
    	justify-content:space-between;
    	margin-top:20px;
    	align-items:center;
    	padding:15px;
    }
    
    .list-title{
    	display:grid;
    	grid-template-columns:0.5fr 1fr 1fr 1fr;
    	align-items:center;
    }
    
    .list-status{
    	display:grid;
    	grid-template-columns:1fr 1fr;
    	align-items:center;
    	text-align:center;
    }
    
    #page-area{
    	display:flex;
    	justify-content:center;
    	align-items:center;
        margin-top: 50px;
    }
    #page-area > a{
		margin:15px;
    }
    
    
</style>
</head>
<body>

    <div id="wrap">
    
    <%@ include file="/WEB-INF/views/common/main.jsp" %>

   <div id="mainboard">
        <div id="approval">
        
        		
					<h1>결재</h1>
        		<div class="approval-menu">
		        	<div class="approval-list">
		        		<a href="${root}/approval/approvalFirstPage">나의 결재</a>
		        		<a href="${root}/approval/getApproval">내가 받은 결재</a>
		        		<a href="${root}/approval/deleteApproval">삭제된 결재</a>
		        		<a href="${root}/approval/referrerApproval">참조 결재</a>
		        	</div>
		        	
		        	<div class="approval-write">
		        		<a href="#">휴가 신청서</a>
		        		<a href="#">지출 결의서</a>
		        		<a href="#">업무 보고서</a>
		        	</div>
        		</div>
        		
				<hr class="line">  
				
				<div id="approval-content">
					
					
					<div class="list">
						<div class="list-title">
							<img alt="" src="${root}/resources/img/clipboard-minus-fill.svg">
							<div>[구매]홍길동</div>
							<div>[휴가 신청서]</div>
							<a href="#">휴가 승인 부탁드립니다.</a>
						</div>
						
						<div class="list-status">
							<div>2023-07-16 13:37</div>
							<div>진행중</div>
						</div>
					</div>
					
					<div class="list">
						<div class="list-title">
							<img alt="" src="${root}/resources/img/clipboard-minus-fill.svg">
							<div>[구매]홍길동</div>
							<div>[휴가 신청서]</div>
							<a href="#">휴가 승인 부탁드립니다.</a>
						</div>
						
						<div class="list-status">
							<div>2023-07-16 13:37</div>
							<div>진행중</div>
						</div>
					</div>
					
					<div class="list">
						<div class="list-title">
							<img alt="" src="${root}/resources/img/clipboard-minus-fill.svg">
							<div>[구매]홍길동</div>
							<div>[휴가 신청서]</div>
							<a href="#">휴가 승인 부탁드립니다.</a>
						</div>
						
						<div class="list-status">
							<div>2023-07-16 13:37</div>
							<div>진행중</div>
						</div>
					</div>
					
					<div class="list">
						<div class="list-title">
							<img alt="" src="${root}/resources/img/clipboard-minus-fill.svg">
							<div>[구매]홍길동</div>
							<div>[휴가 신청서]</div>
							<a href="#">휴가 승인 부탁드립니다.</a>
						</div>
						
						<div class="list-status">
							<div>2023-07-16 13:37</div>
							<div>진행중</div>
						</div>
					</div>
					
					<div class="list">
						<div class="list-title">
							<img alt="" src="${root}/resources/img/clipboard-minus-fill.svg">
							<div>[구매]홍길동</div>
							<div>[휴가 신청서]</div>
							<a href="#">휴가 승인 부탁드립니다.</a>
						</div>
						
						<div class="list-status">
							<div>2023-07-16 13:37</div>
							<div>진행중</div>
						</div>
					</div>
					
					<div class="list">
						<div class="list-title">
							<img alt="" src="${root}/resources/img/clipboard-minus-fill.svg">
							<div>[구매]홍길동</div>
							<div>[휴가 신청서]</div>
							<a href="#">휴가 승인 부탁드립니다.</a>
						</div>
						
						<div class="list-status">
							<div>2023-07-16 13:37</div>
							<div>진행중</div>
						</div>
					</div>
					
					
				</div>
				
				<div id="page-area">
					<a style="color:#d9d9d9ed" href="#"><<</a>
					<a style="color:#d9d9d9ed" href="#"><</a>
					<a href="#">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a style="color:#d9d9d9ed" href="#">></a>
					<a style="color:#d9d9d9ed" href="#">>></a>
				</div>

        </div>

   
   </div>
			</div>
    


	<script>
	
	</script>
	

</body>
</html>