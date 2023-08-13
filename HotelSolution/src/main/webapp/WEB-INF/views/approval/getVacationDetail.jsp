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
      #head-left > h1{
    	font-size:25px;
    	padding:0px 0px 10px;
    	margin-top:10px;
    }
    
    #head-left > input{
    	font-size:18px;
    }
    
    #document{
    	position:relative;
    	top:40px;
    }
    
    #document > table{
    	border-collapse:collapse;
    	width:700px;
    }
    
    #document > table > thead > tr > td:not(:first-child){
        width: 500px;
    }
    
    #document > table > thead > tr > td:first-child{
    	text-align:center;
    }
    
    #document > table > tbody > tr > td:first-child{
    	text-align:center;
    }
    
    #document > table > thead > tr > td{
    	border: 1px solid black;
    	text-align:center;
    	vertical-align:middle;
    }
    
     #document > table > tbody > tr > td{
     	border: 1px solid black;
     	text-align:center;
    	vertical-align:middle;
     }

    #document td .input{
    	width:500px;
    	border:none;
    	text-align:center;
    	outline:none;
    }
    
    .document-title{
    	height:30px;
    }
    
    .info{
    	height:50px;
    }
    
    .reason{
    	height:90px;
    }
    
    .replace{
    	height:30px;
    }

    #document > table > tbody > tr:last-child{

        height: 200px;

    }
    
    #document > .table >tbody > tr > td > textarea{
    	resize:none;
    	overflow:hidden;
    	height:90px;
    	width:500px;
    	border:none;
    	outline:none;
    	
    }
    
    #last-td{
    	font-weight:bold;
    	margin-top:50px;
    }
    
    .end-div{
    	display:flex;
    	justify-content:flex-end;
    	margin-top:15px;
    	margin-right:20px;
    }
    
	.table{
		margin:auto;
		height:600px;
		margin-top:20px;
	}
	
	input[type="date"][readonly]::-webkit-calendar-picker-indicator {
    display: none;
	}
	
	input[type="date"][readonly] {
    margin: 0;
    padding: 0;
    width:95px;
	}
	
	#status-btn{
		margin-top:30px;
	}
	
	#status-btn > button{
		border: 1px solid black;
		color:white;
		height:25px;
		border-radius:5px;
		background-color:#3B444B;
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
						<h1>호텔 솔루션 휴가 신청서</h1>        
						<span class="date">기간</span> : 
						<input type="date" class="myDate" value="${vo.vacationStart.substring(0, 10)}" readonly> ~ <input type="date" class="myDate" value="${vo.vacationEnd.substring(0, 10)}" readonly>
        			</div>
					
					<div id="head-right">
						
						<table>
                            <thead>
                                <tr>
                                    <td>기안자</td>
                                    <td>팀장</td>
                                    <td>인사팀 팀장</td>
                                </tr>
                            </thead>
                               <tbody>
	                                <tr>
	                                	<td>${vo.writerName}</td>
											    <c:choose>
											         <c:when test="${ list[0].statusName eq '진행중'}">
	                                					<td class="teamLeader">
											          	  ${list[0].approverName}
											          	  	<input type="hidden" class="tl" value="${list[0].approverName}">
														</td>
											        </c:when>
											        <c:otherwise>
														<c:choose>
															<c:when test="${list[0].statusName == '승인'}">
																<td class="teamLeader" style="color : blue">
																	<input type="hidden" class="tl" value="${list[0].statusName}">
																	  ${list[0].approverName}(${list[0].statusName})
																 </td>
															</c:when>
															
															<c:when test="${list[0].statusName == '반려'}">
																<td class="teamLeader" style="color : red">
																	<input type="hidden" class="tl" value="${list[0].statusName}">
																	  ${list[0].approverName}(${list[0].statusName})
																 </td>
															</c:when>
														</c:choose>
											        </c:otherwise>
											    </c:choose>

											<input type="hidden" class="teamLeaderNo" value="${list[0].appNo}">
											    <c:choose>
											         <c:when test="${ list[1].statusName eq '진행중'}">
											      		  <td class="hrLeader">
											           			${list[1].approverName}
											           	</td>
											        </c:when>
											        <c:otherwise>
														<c:choose>
															<c:when test="${list[1].statusName  == '승인'}">
																<td class="hrLeader" style="color:blue">
																	   ${list[1].approverName}(${list[1].statusName})
																   </td>
															</c:when>
															
															<c:when test="${list[1].statusName  == '반려'}">
																<td class="hrLeader" style="color:red">
																	   ${list[1].approverName}(${list[1].statusName})
																   </td>
															</c:when>

														</c:choose>
											        </c:otherwise>
											    </c:choose>
											<input type="hidden" class="hrLeaderNo" value="${list[1].appNo}">
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
        			<table class="table">
                        <thead>
                            <tr>
                                <td>제목</td>
                                <td class="document-title"><input class="input" type="text" name="title" value="${vo.title }" readonly></td>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td class="info">소속</td>
                                <td>${vo.teamName}</td>
                            </tr>

                            <tr>
                                <td class="info">직책</td>
                                <td>${vo.positionName}</td>
                            </tr>

                            <tr>
                                <td class="info">성명</td>
                                <td>${vo.writerName }</td>
                            </tr>
                            
                            <tr>
                                <td class="reason">사유</td>
                               <td><textarea name="content" readonly>${vo.content}</textarea></td>
                            </tr>

                            <tr>
                                <td class="replace">비상 연락망</td>
                                <td><input class="input" type="text" name="phone" readonly></td>
                            </tr>
                            
                           	<tr>
                           		<td colspan="2">
                           			<div id="last-td">
	                           			<div style="margin-top:10px;">위의 사유로 휴가신청서를 제출합니다.</div>
	                           			<div class="end-div">작성인 : ${vo.writerName}</div>
									</div>
									<div id="status-btn">
										<button onclick="submit('${loginMember.no}');"> 승인</button>
										<button onclick="reject('${loginMember.no}');">반려</button>
									</div>
                           		</td>
                           	</tr>

                        </tbody>
                      
                    </table>

                    
        		</div>


	    </div>
   	<input type="hidden" class="approvalNo" value="${vo.no}">
   </div>


	
    </div>
    
	

</body>
	<script>
	
	/// 반려버튼 클릭시
	function reject(loginMemberNo) {
    	  let approvalNo = document.querySelector(".approvalNo").value;
          let teamLeader = document.querySelector('.teamLeader');
          let tl = document.querySelector('.tl').value;
          let hrLeader = document.querySelector('.hrLeader');
          let hl = hrLeader.textContent;
          let teamLeaderNo =document.querySelector('.teamLeaderNo').value;
          let hrLeaderNo =document.querySelector('.hrLeaderNo').value;
    	    if (teamLeaderNo === loginMemberNo) {
    	        if (confirm("반려하시겠습니까?")) {
    	            $.ajax({
    	                url: "${root}/approval/reject",
    	                method: "POST",
    	                data: {
    	                    approverNo: teamLeaderNo,
    	                    approvalNo: approvalNo
    	                },
    	                dataType: "json",
    	                success: function (x) {
    	                    alert('반려처리 되었습니다.');
    	                    teamLeader.style.color = "red";
    	                    location.reload();
    	                },
    	                error: function (e) {
    	                    console.log(e);
    	                },
    	            });
    	        }
    	    } else if (hrLeaderNo === loginMemberNo) {
    	            if (confirm("반려하시겠습니까?")) {
    	                $.ajax({
    	                    url: "${root}/approval/reject",
    	                    method: "POST",
    	                    data: {
    	                        approverNo: hrLeaderNo,
    	                        approvalNo: approvalNo
    	                    },
    	                    dataType: "json",
    	                    success: function (x) {
    	                        alert('반려처리 되었습니다.');
    	                        hrLeader.style.color = "red";
    	                        location.reload();
    	                    },
    	                    error: function (e) {
    	                        console.log(e);
    	                    },
    	                });
    	            }
    	    }
    	}
	
	
	
	
   ///승인버튼 클릭시
   
      function submit(loginMemberNo) {
    	  let approvalNo = document.querySelector(".approvalNo").value;
          let teamLeader = document.querySelector('.teamLeader');
          let tl = document.querySelector('.tl').value;
          let hrLeader = document.querySelector('.hrLeader');
          let hl = hrLeader.textContent;
          let teamLeaderNo =document.querySelector('.teamLeaderNo').value;
          let hrLeaderNo =document.querySelector('.hrLeaderNo').value;
          
    	    if (teamLeaderNo === loginMemberNo) {
    	        if (confirm("승인하시겠습니까?")) {
    	            $.ajax({
    	                url: "${root}/approval/submit",
    	                method: "POST",
    	                data: {
    	                    approverNo: teamLeaderNo,
    	                    approvalNo: approvalNo
    	                },
    	                dataType: "json",
    	                success: function (x) {
    	                    alert('승인처리 되었습니다.');
    	                    location.reload();
    	                },
    	                error: function (e) {
    	                    console.log(e);
    	                },
    	            });
    	        }
    	    } else if (hrLeaderNo === loginMemberNo) {
    	        if (tl === "승인") {
    	            if (confirm("승인하시겠습니까?")) {
    	                $.ajax({
    	                    url: "${root}/approval/lastSubmit",
    	                    method: "POST",
    	                    data: {
    	                        approverNo: hrLeaderNo,
    	                        approvalNo: approvalNo
    	                    },
    	                    dataType: "json",
    	                    success: function (x) {
    	                        alert('승인처리 되었습니다.');
    	                        location.reload();
    	                    },
    	                    error: function (e) {
    	                        console.log(e);
    	                    },
    	                });
    	            }
    	        } else {
    	            alert("결재 순번이 아닙니다.");
    	        }
    	    }
    	}

	</script>
</html>