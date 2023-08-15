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
        height: 800px;
        background-color:white;
        margin:auto;
        border-radius:10px;
    }
    
    .myDate{
    	color:#949494;
    	border:none;
        outline: none;
    }
    
    .title , .date{
    	color:#949494;
    	font-size:18px;
    }
    
    #head-right > table{
    	border: 1px solid lightgray;
    	text-align:center;
    	border-collapse:collapse;
    	table-layout:fixed;
    	width:100;
    	position:relative;
    	top:20px;
    	right:40px;
    }
    
   #head-right > table tr{
    	border:1px solid lightgray;
    	width:20%;
    	padding:10px;
    	height:30px;
    }
    
    #head-right > table td{
    	letter-spacing:2px;
    	border:1px solid lightgray;
    	padding:7px;
    	width:1%;
    	font-size:12px;
    	font-weight:bold;
    	vertical-align:middle;
    }
    
    #head{
    	display:grid;
    	grid-template-columns:1.5fr 1fr;
    }
    
    #head-left{
    	position:relative;
    	top:40px;
    	left:30px;
    }
    
    #document{
    	position:relative;
    	top:40px;
    }
    
    #head-left > h1{
    	font-size:25px;
    	padding:0px 0px 10px;
    	margin-top:10px;
    }
    
    #head-left > input{
    	font-size:18px;
    }

    /* #document > table > tbody > tr:last-child{

        height: 100px;

    } */
    
    .first-table , .second-table{
    	border-collapse: collapse;
        border: 1px solid lightgray;
        border-top: 1px solid black;
    }
    
    .first-table > thead > tr > td{
    	width:90px;
    	height:50px;
    	text-align:center;
    	border: 1px solid lightgray;
    	vertical-align:middle;
    }

    .first-table > thead > tr > td > input{
    	
    	width: 500px;
    
    }
    
     .first-table > tbody > tr > td{
    	width:125px;
    	height:50px;
    	text-align:center;
    	border:1px solid lightgray;
    	vertical-align:middle;
    }
    
	.input{
		border:none;
		outline:none;
		text-align:center;
	}    

    .end-input{
    	border:none;
    	outline:none;
    	font-size:16px;
    	font-weight:bold;
    }
    
    #last-td{
    	font-weight:bold;
    }
    
    .end-div{
    	display:flex;
    	justify-content:flex-end;
    	margin-top:15px;
    }
    
    .submitBtn{
    	display:flex;
    	align-items:center;
    	justify-content:center;
    }
    
    input[type=submit]{
        background-color: #d9d9d9ed;
        border: 1px solid lightgray;
        border-radius:5px;
    }

	.first-table{
		margin:auto;
		margin-top:20px;
		width:800px;
	}
	
	.second-table{
		margin:auto;
		margin-top:20px;
		width:800px;
		height:450px;
	}
	
	.second-table > thead > tr > td{
    	width:90px;
    	text-align:center;
    	border: 1px solid lightgray;
    	vertical-align:middle;
    }
    
    .second-table > tbody > tr > td{
    	width:125px;
    	text-align:center;
    	border:1px solid lightgray;
    	vertical-align:middle;
    }
    
    .second-table > thead > tr > th{
    	text-align:center;
    	height:30px;
    	vertical-align:middle;
    }
	
	.second-table > thead > tr > td:first-child{
		width:250px;
	}
	
	.second-table > thead > tr > td:last-child{
		width:190px;
	}
	
	tbody input[name="product"]{
		width:250px;
		box-sizing:border-box;
	}

    tbody input[name="price"]{
		width:150px;
		box-sizing:border-box;
	}
	
	tbody input[name="totalPrice"]{
		width:150px;
		box-sizing:border-box;
	}
	
	tbody input[name="count"]{
		width:190px;
		box-sizing:border-box;
	}
	
	.second-table input{
		border:none;
		outline:none;
		text-align:center;
	}
	
	.second-table > tbody > tr > th{
		text-align:center;
		vertical-align:middle;
	}
	
	.last-td-content{
		margin-top:20px;
		display:flex;
		justify-content:center;
		margin-left:60px;
		font-size: 1.1em;
	}
	
	 .end-div{
    	display:flex;
    	justify-content:flex-end;
    	margin-top:15px;
    	margin-right:20px;
    }

</style>
</head>
<body>

    <div id="wrap">
    
    <%@ include file="/WEB-INF/views/common/main.jsp" %>

   <div id="mainboard">
        <div id="approval">
        
        	
        		<div id ="head">
        		
        			<div id="head-left">
						<div class="title">기안문서</div>
						<h1>호텔 솔루션 지출결의서</h1>        
						<span class="date">요청일자</span> 
					 	 : <input type="date" class="myDate" readonly value="${vo.enrollDate.substring(0, 10)}">
        			</div>
					
					<div id="head-right">
						
						<table>
                            <thead>
                                <tr>
                                    <td>기안자</td>
                                    <td>팀장</td>
                                    <td>구매/재무팀 팀장</td>
                                </tr>
                            </thead>
                               <tbody>
	                                <tr>
	                                	<td>${vo.writerName}</td>
	                                	<c:choose>
	                                		<c:when test="${list[0].statusName == '승인' }">
			                                	<td class="teamLeader" style="color:blue;">${list[0].approverName}(${list[0].statusName})</td>
	                                		</c:when>
	                                		
	                                		<c:when test="${list[0].statusName == '반려' }">
	                                			<td class="teamLeader" style="color:red;">${list[0].approverName}(${list[0].statusName})</td>
	                                		</c:when>

                                            <c:when test="${list[0].statusName == '진행중'}">
                                                <td class="teamLeader">${list[0].approverName}(${list[0].statusName})</td>
                                            </c:when>
	                                	</c:choose>
	                                	
	                                	<c:choose>
	                                		<c:when test="${list[1].statusName == '승인' }">
			                                	<td class="hrLeader" style="color:blue;">${list[1].approverName}(${list[1].statusName})</td>
	                                		</c:when>

	                                		<c:when test="${list[1].statusName == '반려' }">
			                                	<td class="hrLeader" style="color:red;">${list[1].approverName}(${list[1].statusName})</td>
	                                		</c:when>

                                            <c:when test="${list[1].statusName == '진행중'}">
                                                <td class="hrLeader">${list[1].approverName}(${list[1].statusName})</td>
                                            </c:when>
	                                	</c:choose>
	                                </tr>
	                                
	                                <tr>
	                                	<td style="font-weight:bold;" colspan="3">참조자</td>
	                                </tr>
	                                
	                                <tr>
	                                	<td class="refer">${fList[0].referrerName}</td>
	                                	<td class="refer">${fList[1].referrerName}</td>
	                                	<td class="refer">${fList[2].referrerName}</td>
	                                </tr>
                                </tbody>
                        </table>
						
					</div>
					
        		</div>
        		
        		<div id="document">
        			<table class="first-table" border="1">
                        <thead>
                            <tr>
                                <td>제목</td>
                                <td colspan="5" class="document-title">${vo.title }</td>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td class="info">소속</td>
                                <td>${vo.teamName}</td>
                                <td class="info">직책</td>
                                <td>${vo.positionName}</td>
                                <td class="info">성명</td>
                                <td>${vo.writerName}</td>
                            </tr>

                        </tbody>
                    </table>
                    

                    <table border="1" class="second-table">
                        <thead>
                            <tr>
                                <th>품명</th>
                                <th>수량</th>
                                <th>금액</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>${itemList[0].name}</td>
                                <td>${itemList[0].count}</td>
                                <td>${itemList[0].count * itemList[0].price}원</td>
                            </tr>
                           
                            <tr>
                                <td>${itemList[1].name}</td>
                                <td>${itemList[1].count}</td>
                                <td>${itemList[1].count * itemList[1].price}원</td>
                            </tr>
                           
                            <tr>
                                <td>${itemList[2].name}</td>
                                <td>${itemList[2].count}</td>
                                <td>${itemList[2].count * itemList[2].price}원</td>
                            </tr>
                           
                            <tr>
                                <td>${itemList[3].name}</td>
   	                            <td>${itemList[3].count}</td>
                                <td>${itemList[3].count * itemList[3].price}원</td>
                            </tr>

                            <tr>
                                <td>${itemList[4].name}</td>
                                <td>${itemList[4].count}</td>
                                <td>${itemList[4].count * itemList[4].price}원</td>
                            </tr>

                            <tr>
                                <td>${itemList[5].name}</td>
                                <td>${itemList[5].count}</td>
                                <td>${itemList[5].count * itemList[5].price}원</td>
                            </tr>

                            <tr>
                                <td>${itemList[6].name}</td>
                                <td>${itemList[6].count}</td>
                                <td>${itemList[6].count * itemList[6].price}원</td>
                            </tr>

                            <tr>
                                <td>${itemList[7].name}</td>
                                <td>${itemList[7].count}</td>
                                <td>${itemList[7].count * itemList[7].price}원</td>
                            </tr>

                            <tr>
                                <th>합계</th>
                                <td>X</td>
                                <td>${itemList[0].totalPrice}원</td>
                            </tr>
                            
                            <tr style="height:180px;">
                           		<td colspan="3">
                           			<div id="last-td">
	                           			<div class="last-td-content">지출결의서를 제출합니다.</div>
	                           			<div class="end-div">작성인 : ${vo.writerName}</div>
                           			</div>
                           		</td>
                           	</tr>
                        </tbody>
                    </table>
                    
        		</div>
        		
	    </div>

   
   </div>


    </div>
    
	<script>

	
	</script>
	

</body>
</html>