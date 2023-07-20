<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${root}/resources/css/common/home.css">

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<style>
    body{
        margin: 0;
        background-color: lightgray;
    }
    
    #menu{
    	display:grid;
    	justify-content:center;
    	margin-top : 25px;
    	grid-template-rows: 1fr 1fr 1fr;
    }

    .menu-bar{

        width: 800px;
        height: 250px;
        border: 1px solid white;
        border-radius: 10px;
        background-color: white;
    }
    
    .first-menu{
    	display:grid;
    	grid-template-rows: 1fr 1fr;
    	width:350px;
    	height:180px;
    	position:relative;
    	left:20px;
    	top:20px;
    }
    
    .clock{
    	width: 250px;
    	height:35px;
    	background-color:#3B444B;
    	color:white;
    	border : 1px solid #3B444B;
    	border-radius:20px;
        display:flex;
		line-height:35px;
		justify-content:center;
    }
    
    .time{
    	font-size:2.5em;
    	position:relative;
    	top:23px;
    }
    
    .menu-img{
    	display:flex;
    	flex-direction: row-reverse;
    }
    
    .menu-img img{
    	width:350px;
    	height:230px;
    	position:absolute;
    	top:100px;
    }
    
    .secend-menu{
    	width:350px;
    	border:1px solid #3B444B;
    	background-color:#3B444B;
    	color:white;
    	display:grid;
    	grid-template-columns: 1fr 1fr;
    	height:120px;
    	border-radius:10px;
    }
    
    .secend-menu button{
    	background-color : #3B444B;
    	border: 1px solid white;
    	border-radius:16px;
    	color:white;
        cursor: pointer;
        width:70px;
        height:40px;
        font-size:1.2em;
    }
    
    .work-btn{
    	display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        text-align: center;
        margin-bottom:15px;
    }
    
    .text{
    	font-size:12px;
    }
    
    .work-time{
    	position:relative;
    	left:10px;
    	top:10px;
    }
    
    .work-time-text{
    	position:relative;
    	top:10px;
    }

    table{
        border: 1px solid lightgray;
        border-collapse: collapse;
        width: 750px;
       	height:170px;
       	position:relative;
       	top:10px;
       	text-align:center;
    }

    table > thead{
        background-color: #d9d9d9ed;
        font-size:15px;
        height:35px;
    }
    
    table > thead > tr > td{
    	vertical-align:middle;
    }
    
    tbody > tr > td{
    	vertical-align:middle;
    }
    
    td{
    	letter-spacing:2px;
    }
    
    .table-title{
    	font-size:1.5em;
		font-weight:bold;
    }
    
    .table-content{
    	color : #D9D9D9;
    }
    
    #three-menu{
    	position:relative;
    	top:15px;
    	display:flex;
    	flex-direction:column;
    	left:20px;
    }

    tbody tr td:not(:first-child){
        font-size: 13px;
        color:#D9D9D9;
    }
    
    tbody tr td:first-child{
    	font-size:15px;
    	border:1px solid #D9D9D9;
    }
    
    #YN > td:not(:first-child){
    	color:black;
    }
    
    tbody tr{
    	border : 1px solid #D9D9D9;
    }
    
    
</style>
</head>
<body>

	<div id="wrap">
	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
  <%@ include file="/WEB-INF/views/common/aside.jsp" %>

  <main>
    <div class="main-container">
      
      <%@ include file="/WEB-INF/views/common/mainaside.jsp"%>

        <div id="menu">
            <div class="menu-bar">
            	<div class="first-menu">
	            	<div><h3 class="clock"></h3></div>
		               <div class="secend-menu">
			               <div class="work-time">
				               	<div class="work-time-text">오늘 근무한 시간</div>
				               	<div><h1 class="time"></h1></div>
			               </div>
			               	<div class="work-btn">
				               	<div><button style="position:relative; right:10px;">출근</button></div>
				               	<div><button>퇴근</button></div>
				               	<div class="text">버튼을 눌러 출근시간을 기록하세요</div>
			               	</div>
		               </div>
            	</div>
            	<div class="menu-img">
		                <img alt="" src="${root}/resources/img/일하는사람.jpeg">
            	</div>
            </div>
            <div class="menu-bar">
                <canvas id="myChart" width="100" height="100"></canvas>
            </div>
            <div class="menu-bar">

				<div id="three-menu">
					<div class="table-title">주간 테이블</div>
					<div class="table-content">김찬진 사원님의 근태관리 내역입니다.</div>				
	                <table>
	                    <thead>
	                        <tr>
	                            <td>일자(요일)</td>
	                            <td>07/03(월)</td>
	                            <td>07/04(화)</td>
	                            <td>07/05(수)</td>
	                            <td>07/06(목)</td>
	                            <td>07/07(금)</td>
	                            <td>07/08(토)</td>
	                            <td>07/09(일)</td>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<tr>
	                    		<td>근무시간</td>
	                    		<td>08:00</td>
	                    		<td>08:00</td>
	                    		<td>08:00</td>
	                    		<td>08:00</td>
	                    		<td>08:00</td>
	                    		<td>-</td>
	                    		<td>-</td>
	                    	</tr>
	                    	<tr>
	                    		<td>연장근무시간</td>
	                    		<td>03:00</td>
	                    		<td>03:00</td>
	                    		<td>03:00</td>
	                    		<td>03:00</td>
	                    		<td>03:00</td>
	                    		<td>-</td>
	                    		<td>-</td>
	                    	</tr>
	                    	<tr>
	                    		<td>총 근무시간</td>
	                    		<td>11:30</td>
	                    		<td>11:30</td>
	                    		<td>11:30</td>
	                    		<td>11:30</td>
	                    		<td>11:30</td>
	                    		<td>-</td>
	                    		<td>-</td>
	                    	</tr>
	                    	<tr id="YN">
	                    		<td>상태</td>
	                    		<td>정상처리</td>
	                    		<td>정상처리</td>
	                    		<td>정상처리</td>
	                    		<td>정상처리</td>
	                    		<td>정상처리</td>
	                    		<td></td>
	                    		<td></td>
	                    	</tr>
	                    </tbody>
	                </table>
				</div>

            </div>
        </div>

    	</div>
    	</main>
    	</div>
    
    <script>
    	
    	const clock = document.querySelector('.clock');
    
        //시계 만들기
        function getTime(params) {
            const time = new Date();
            const month = (time.getMonth()+1);
            const day = time.getDay();
            const dayNames = ["일요일" , "월요일" , "화요일" , "수요일" ,"목요일" , "금요일" , "토요일"]
            const currentDay = dayNames[day];
            const date = time.getDate();
            const hour = String(time.getHours()).padStart(2, "0");
            const minutes = String(time.getMinutes()).padStart(2, "0");
            const seconds = String(time.getSeconds()).padStart(2, "0");
            clock.innerHTML = month+ "월 "+date+ "일 " + hour + ":"+minutes+":"+seconds + " "+ currentDay; 
            
        }
        
        //시계 실행
        getTime();
        setInterval(() => {
            getTime();
        }, 1000);
        
        //아래 시계 만들기
        const clock2 = document.querySelector('.time');
        
        function getTime2(params) {
            const time2 = new Date();
            const hour = String(time2.getHours()).padStart(2, "0");
            const minutes = String(time2.getMinutes()).padStart(2, "0");
            const seconds = String(time2.getSeconds()).padStart(2, "0");
            
            clock2.innerHTML = hour+":"+minutes+":"+seconds;
        }

        //아래 시계 실행
        getTime2();
        setInterval(() => {
            getTime2();
        }, 1000);
        
        //출근 그래프
       
        

    </script>

</body>
</html>