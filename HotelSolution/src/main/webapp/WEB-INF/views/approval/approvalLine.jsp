<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        margin: 0px;
    }

    #wrap{
    	width:100vw;
    	height:100vh;
    	display:flex;
    	justify-content:center;
    	align-items:center;
    }
    
    #box{
        width: 700px;
        height: 600px;
        border: 1px solid #3B444B;
        border-radius: 10px;
        margin: 0 auto;
    }
    
    #logo{
        display: flex;
        justify-content: center;
        margin-top : 30px;
    }
    
    #search-area{
    	display:flex;
    	flex-direction: column;
    	width:270px;
    }

	#search-area > div:first-child{
		font-size:20px;
		font-weight:bold;
		margin-top:10px;
		color: #86C8DB;
	}
	
	#search-bar{
		margin-top:15px;
	}
	
	#search-bar > input{
		width:150px;
	}
	
	#search-bar > button{
		width:50px;
		height:21.5px;
		background-color:white;
		border:1px solid black;
		box-sizing:border-box;
	}
	
	#employee{
		height:350px;
		border:1px solid lightgray;
	}
	
	.team{
		height:30px;
		background-color:#e9ecef;
		border:1px solid #e9ecef;
		box-sizing:border-box;
		display:flex;
		align-items:center;
	}
	
	.teamName{
		padding:7px 0px;
		margin-left :7px;
	}
	
   
	
	
    
</style>
</head>
<body>

	<div id="wrap">

    <form action="">
        <div id="box">
            <div id="logo">
                <img style="width: 300px;" src="${root}/resources/img/호텔솔루션.png" alt="">
            </div>
            
            <div id="search-area">
            	<div class="lineText">결재선 설정</div>
            	<div id="search-bar">
	            	<input type="text" name="search" placeholder="이름,부서 검색">
	            	<button>검색</button>
	            	<div id="employee">
	            		<div class="team-container">
			            	<div class="team">조직도</div>
							${members}
							<div onclick="openHr" class="teamName"><i class="bi bi-plus-circle-fill"></i>인사팀</div>
							<div id="hrTeam" style="display:none">
								<c:forEach items="${members}" var="members">
									<c:if test="${members.positionNo == 4}">
										${members.teamName} ${members.positionName} ${members.name}
									</c:if>
								</c:forEach>
							</div>
							
							<div onclick="openFinance" class="teamName"><i class="bi bi-plus-circle-fill"></i>구매/재무팀</div>
							<div id="financeTeam" style="display:none">
								<c:forEach items="${members}" var="members">
									<c:if test="${members.positionNo == 5}">
										${members.teamName} ${members.positionName} ${members.name}
									</c:if>
								</c:forEach>
							</div>
							
							<div onclick="openManage" class="teamName"><i class="bi bi-plus-circle-fill"></i>경영지원팀</div>
							<div id="manageTeam" style="display:none">
								<c:forEach items="${members}" var="members">
									<c:if test="${members.positionNo == 1}">
										${members.teamName} ${members.positionName} ${members.name}
									</c:if>
								</c:forEach>
							</div>
							
							<div onclick="openFront" class="teamName"><i class="bi bi-plus-circle-fill"></i>프론트/시설관리팀</div>
							<div id="frontTeam" style="display:none">
								<c:forEach items="${members}" var="members">
									<c:if test="${members.positionNo == 2}">
										${members.teamName} ${members.positionName} ${members.name}
									</c:if>
								</c:forEach>
							</div>
							
							<div onclick="openFood" class="teamName"><i class="bi bi-plus-circle-fill"></i>식음팀</div>
							<div id="foodTeam" style="display:none">
								<c:forEach items="${members}" var="members">
									<c:if test="${members.positionNo == 3}">
										${members.teamName} ${members.positionName} ${members.name}
									</c:if>
								</c:forEach>
							</div>
	            		</div>
	            	</div>
            	</div>
            </div>
            
            <div id="main-area">
            
				            
            </div>
                   

        </div>

     </form>

    </div>

    <script>


    </script>

</body>
</html>