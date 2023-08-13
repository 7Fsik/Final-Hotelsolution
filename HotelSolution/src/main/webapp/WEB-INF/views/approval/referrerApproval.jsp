<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}" />
    <c:set var="getList" value="${map.getList}" />
	<c:set var="pv" value="${map.pv}" />
    
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
        margin-top:20px
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
    	grid-template-columns:0.8fr 1fr 1.5fr 1.5fr;
    	align-items:center;
    	text-align:center;
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
    
    #approval .ref-link:visited {
 		 color: blueviolet;
	}
	
    
    
</style>
</head>
<body>

    <div id="wrap">
    
     <%@ include file="/WEB-INF/views/common/main.jsp" %>

   <div id="mainboard">

        <div id="approval">
        
        		
					<h1>참조 결재</h1>
        		<div class="approval-menu">
		        	<div class="approval-list">
		        		<a href="${root}/approval/approvalFirstPage">나의 결재</a>
		        		<a href="${root}/approval/getApproval">내가 받은 결재</a>
		        		<a href="${root}/approval/referrerApproval" class="ref-link">참조 결재</a>
		        	</div>
		        	
		        	<div class="approval-write">
		        		<div>문서 작성 :</div>
		        		<a href="${root}/approval/vaction">휴가 신청서</a>
		        		<a href="${root}/approval/expenditure">지출 결의서</a>
		        	</div>
        		</div>
        		
				<hr class="line">  
				
				<div id="approval-content">
					
					<c:forEach items="${getList}" var="list">
						<div class="list">
							<div class="list-title">
								<img alt="" src="${root}/resources/img/clipboard-minus-fill.svg">
								<div>[${list.teamName}]${list.sendName}</div>
								<div>[${list.documentTypeName}]</div>
								<a onclick="goDetail('${list.no}' , '${list.typeNo}');">${list.title}</a>
							</div>
							
							<div class="list-status">
									<div>${list.enrollDate}</div>
									<c:if test="${list.adYn == 'N' }">
									<div>진행중</div>
									</c:if>
									<c:if test="${list.adYn == 'Y' }">
										<div>승인</div>
									</c:if>
									<c:if test="${list.adYn == 'X' }">
										<div>반려</div>
									</c:if>
							</div>
						</div>
					</c:forEach>

				</div>
				
				<div id="page-area">
					<c:if test="${pv.currentPage > 1 }">
						<a style="color:black" href="${root}/approval/referrerApproval?p=1"> << </a>
						<a style="color:black" href="${root}/approval/referrerApproval?p=${pv.currentPage-1}"> < </a>
					</c:if>
				
				<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
						<c:if test="${pv.currentPage != i}">
							<a href="${root}/approval/referrerApproval?p=${i}">${i}</a>
						</c:if>
						
						<c:if test="${pv.currentPage == i }">
							<a style="color:red;">${i}</a>
						</c:if>
					</c:forEach>
				
				
					<c:if test="${pv.currentPage < pv.maxPage}">
						<a style="color:black" href="${root}/approval/referrerApproval?p=${pv.currentPage+1}"> > </a>
						<a style="color:black" href="${root}/approval/referrerApproval?p=${pv.maxPage}"> >> </a>
					</c:if>
				</div>

        </div>
   
   </div>
    
			</div>
    


	<script>

		function goDetail(no,typeNo) {
			
			if(typeNo == 1){
				location.href = '${root}/approval/vactionDetail?no=' + no;
			}

			if(typeNo == 2){
				location.href = '${root}/approval/expenditureDetail?no=' +no;
			}

		}
	
	</script>
	

</body>
</html>