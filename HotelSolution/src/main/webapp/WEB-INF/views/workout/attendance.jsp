<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/common/home.css">
<style>
    body{
        margin: 0;
        background-color: lightgray;
    }
    
    #menu{
    	display:grid;
    	justify-content:center;
    	grid-template-rows: 1fr 1fr 1fr;
		grid-gap: 20px;
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
    
    .menu-img{
    	display:flex;
    	flex-direction: row-reverse;
    }
    
    .menu-img img{
    	width:350px;
    	height:230px;
    	position:absolute;
    	top:10px;
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
    	font-size:1.2em;
		font-weight:bold;
    }
    
    .table-content{
    	color : #adb5bd;
		font-size: 15px;
		position:relative;
		top:5px;
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
    
    #stopwatch{
		font-size:1.8em;
		position:relative;
		top:23px;
    }

	#startBtn{
		position: relative;
		right: 10px;
	}

	.blueCircle{
		width:10px;
		height:10px;
		border : 5px solid #86C8DB;
		border-radius: 50%;
		box-sizing: border-box;
	}
	
	.skinCircle{
		width:10px;
		height:10px;
		border : 5px solid #EBD1D1;
		border-radius: 50%;
		box-sizing: border-box;
	}

	.grayCircle{
		width:10px;
		height:10px;
		border : 5px solid #adb5bd;
		border-radius: 50%;
		box-sizing: border-box;
	}
	
	.circleContent{
		font-size: 12px;
		font-weight:bold;
	}
	
	.CurworkTime{
		width:90px;
		height:20px;
		border: 1px solid #bbe9f6;
		text-align:center;
		border-radius:20px;
		background-color: #bbe9f6;
		color: #86C8DB;
		font-weight:bold;
		font-size: 13px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.CurworkTimeText{
		color: #86C8DB;
		font-weight:bold;
	}
	
	.workTime{
		width:80px;
		height:20px;
		border: 1px solid #6c8af7;
		text-align:center;
		border-radius:20px;
		background-color: #6c8af7;
		color: #2650E7;
		font-weight:bold;
		font-size: 13px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.workTimeText{
		color: #2650E7;
		font-weight:bold;
	}
	
	.graphEle{
		display:flex;
		justify-content: space-evenly;
		align-items: center;
		width: 650px;
		margin: auto;
	}

	#chartJs{
		display: flex;
		height: 130px;
		justify-content:space-evenly;
	}
	
	#doughnut-chart{
		position:relative;
		bottom:20px;
		width:160px;
		height:160px;
	}
	
	#myChart{
		position:relative;
		top:25px;
	}
    
	#commuteText{
		position: relative;
		top:15px;
		left:20px
	}

	.center-text {
	  position: absolute;
	  top: 45%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  font-weight: bold;
	  color:black;
	  font-size:13px;
	  width:120px;
	  text-align:center;
	}
	
	.number{
		color: #86C8DB;
		font-size:25px;
	}
    
</style>
</head>
<body>

	<div id="wrap">
	
		<%@ include file="/WEB-INF/views/common/main.jsp" %>

	<div id="mainboard">

        <div id="menu">
            <div class="menu-bar">
            	<div class="first-menu">
	            	<div><h3 class="clock"></h3></div>
		               <div class="secend-menu">
			               <div class="work-time">
				               	<div class="work-time-text">오늘 근무한 시간</div>
				               	<div id="stopwatch">
				               		<span id="time">00</span>
				               		<span>:</span>
				               		<span id="min">00</span>
				               		<span>:</span>
				               		<span id="sec">00</span>
				               	</div>
			               </div>
			               	<div class="work-btn">
				               	<div><button id="startBtn" onclick="startClock();">출근</button></div>
				               	<div><button id="endBtn" onclick="stopClock();">퇴근</button></div>
				               	<div class="text">버튼을 눌러 <br>출근시간을 기록하세요</div>
			               	</div>
		               </div>
            	</div>
            	<div class="menu-img">
		                <img alt="" src="${root}/resources/img/일하는사람.jpeg">
            	</div>
            </div>
            <div class="menu-bar">
            	<div id="commuteText">
	            	<div class="table-title">총 근무시간</div>
					<div class="table-content">${sessionScope.loginMember.name}님의 근태관리 내역입니다.</div>
            	</div>
            	
            	<div id="chartJs">
	                <canvas id="myChart" width="350" height="120"></canvas>
					<div style="position: relative">
						<canvas id="doughnut-chart"></canvas>
						<div class="center-text">주간 근무시간 <br><br><span id="hours" class="number"></span> 시간 <span class="number">${min%60}</span>분</div>
					</div>
            	</div>
                <hr>
				<div class="graphEle">
					<div class="blueCircle"></div>
					<div class="circleContent">근무시간</div>
					<div class="skinCircle"></div>
					<div class="circleContent">휴가</div>
					<div class="grayCircle"></div>
					<div class="circleContent">잔여 근무시간</div>
					<div class="CurworkTime">주간 근무시간</div>
					<div class="CurworkTimeText"><span id="hour"></span>시간 ${min%60}분</div>
					<div class="workTime">총 근무시간</div>
					<div class="workTimeText">40시간 0분</div>
				</div>
            </div>
            <div class="menu-bar">

				<div id="three-menu">
					<div class="table-title">주간 테이블</div>
					<div class="table-content">${sessionScope.loginMember.name}님의 근태관리 내역입니다.</div>				
					<table>
	                    <thead>
	                        <tr>
	                            <td>일자(요일)</td>
	                            
	                            <td>${workEndDayList[1]}(월)</td>
	                            <td>${workEndDayList[2]}(화)</td>
	                            <td>${workEndDayList[3]}(수)</td>
	                            <td>${workEndDayList[4]}(목)</td>
	                            <td>${workEndDayList[5]}(금)</td>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<tr>
	                    		<td>출근시간</td>
	                    		<td>${workStartTimeList[1]}</td>
	                    		<td>${workStartTimeList[2]}</td>
	                    		<td>${workStartTimeList[3]}</td>
	                    		<td>${workStartTimeList[4]}</td>
	                    		<td>${workStartTimeList[5]}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>퇴근시간</td>
	                    		<td>${workEndTimeList[1]}</td>
	                    		<td>${workEndTimeList[2]}</td>
	                    		<td>${workEndTimeList[3]}</td>
	                    		<td>${workEndTimeList[4]}</td>
	                    		<td>${workEndTimeList[5]}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>오늘 근무시간</td>
	                    		<td class="tableWorkTime"></td>
	                    		<td class="tableWorkTime"></td>
	                    		<td class="tableWorkTime"></td>
	                    		<td class="tableWorkTime"></td>
	                    		<td class="tableWorkTime"></td>
	                    	</tr>
	                    	<tr id="YN">
	                    		<td>상태</td>
	                    		<td>정상처리</td>
	                    		<td>정상처리</td>
	                    		<td>정상처리</td>
	                    		<td>정상처리</td>
	                    		<td>정상처리</td>
	                    	</tr>
	                    </tbody>
	                </table>
				</div>

            </div>
        </div>

	</div>
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
        
		//출퇴근 버튼 작동하기
		let interval;
		let startTime = null;
		
		function startClock() {
			startTime = Date.now();
			localStorage.setItem("startTime", startTime);
			interval = setInterval(updateClock, 1000);
			updateClock();
		}
		
		function updateClock() {
			if (!startTime) return;
			
			const currentTime = Date.now();
			const elapsedTime = currentTime - startTime;
			const seconds = Math.floor(elapsedTime / 1000) % 60;
			const minutes = Math.floor(elapsedTime / 1000 / 60) % 60;
			const hours = Math.floor(elapsedTime / 1000 / 60 / 60);
			
			document.getElementById("time").textContent = formatTime(hours);
			document.getElementById("min").textContent = formatTime(minutes);
			document.getElementById("sec").textContent = formatTime(seconds);
		}
		
		function formatTime(time) {
			return time.toString().padStart(2, "0");
		}
		
		function stopClock() {
			clearInterval(interval);
			startTime = null;
			localStorage.removeItem("startTime");
			document.getElementById("time").textContent = "00";
			document.getElementById("min").textContent = "00";
			document.getElementById("sec").textContent = "00";
		}

		document.getElementById("startBtn").addEventListener("click", () => {
			startClock();
		});
		
		document.getElementById("endBtn").addEventListener("click", () => {
			stopClock();
		});
		
		const storedStartTime = localStorage.getItem("startTime");
		if (storedStartTime) {
			startTime = parseInt(storedStartTime);
			interval = setInterval(updateClock, 1000);
			updateClock();
		}
		
		//출근버튼 눌렀을때 출근시간 DB에 인서트	
		let isStarted = false;
		
		const startBtn = document.querySelector('#startBtn');
		startBtn.addEventListener('click' , (event)=>{
			if(!isStarted){
				startBtn.disabled = true;
				endBtn.disabled = false;
				$.ajax({
					type : 'post',
					url : '${root}/workout/recordStartTime',
					data : {},
					success : (data)=>{
						if(data === "success"){
							alert('출근처리 되었습니다.');
						}else{
							alert('출근 처리 오류');
						}
					},
					error : (e)=>{
						alert('통신 실패');
					}
				})
			}
		});
		
		//퇴근버튼 눌렀을때 퇴근시간 DB에 인서트
		const endBtn = document.querySelector('#endBtn');
		endBtn.addEventListener('click' , ()=>{
			if(!isStarted){
				startBtn.disabled = false;
				endBtn.disabled = true;
				$.ajax({
					type : 'post',
					url : '${root}/workout/recordEndTime',
					data : {},
					success : (data)=>{
						if(data ==="success"){
							console.log(data);
							alert('퇴근처리 되었습니다.');
						}else{
							alert('퇴근 처리 오류');
						}
					},
					error : (e)=>{
						console.log(e);
						alert('통신 실패');
					}
				});
			};
		});
		endBtn.disabled = true;
		
		const time = new Date();
		const day = time.getDay();
		const dayNames = ["일요일" , "월요일" , "화요일" , "수요일" ,"목요일" , "금요일" , "토요일"]
		const currentDay = dayNames[day];
		//출근 그래프
		const labels = [
			dayNames[1],
			dayNames[2],
			dayNames[3],
			dayNames[4],
			dayNames[5],
			dayNames[6],
			dayNames[0],
		];

		
		const data = {
			labels: labels,
			datasets: [{
			label: '근무시간',
			backgroundColor: ['#86C8DB', '#86C8DB' , '#86C8DB' , '#86C8DB' , '#86C8DB' , "#e9ecef" , "#e9ecef"],
			borderColor: ['#86C8DB', '#86C8DB' , '#86C8DB' , '#86C8DB' ,'#86C8DB' , "#e9ecef" , "#e9ecef"],
			data: [
				'${workMinuteList[1]}'/60,'${workMinuteList[2]}'/60,'${workMinuteList[3]}'/60,'${workMinuteList[4]}'/60,'${workMinuteList[5]}'/60 , 15 , 15]
			}],

		};

		const config = {
			type: 'bar',
			data: data,
			options: {
				responsive:false,
				scales: {
				  /*  x: {
					display: false, // Hide the x-axis scale and labels
				  },   */
				  y: {
					display: false, // Hide the y-axis scale and labels
					
				  } 
				},
				plugins: {
      legend: {
        display: false, // Hide the legend (dataset label)
        padding: 10,
      },
      tooltip: {
        filter: function (tooltipItem) {
          // Hide tooltip for Saturday and Sunday (6 and 0 are indices for Saturday and Sunday respectively)
          return tooltipItem.dataIndex !== 5 && tooltipItem.dataIndex !== 6;
        },
      },
    },
    tooltips: {
      mode: 'index',
      intersect: false,
    },
    barPercentage: 0.7, // Adjust the width of the bars (0.8 means 80% width of the available space)
    categoryPercentage: 0.5,
  },
};
			const myChart = new Chart(document.getElementById('myChart'),config);

			
		//출근도넛 차트
		new Chart(document.getElementById("doughnut-chart"), {
			type: 'doughnut',
			data: {
				labels: ["총 근무시간", "잔여근무 시간"],
				datasets: [
					{
						backgroundColor: ["#86C8DB", "#adb5bd"],
						data: ['${min}'/60,'${lastM}'/60]
					}
				]
			},
			options: {
				responsive:false,
				cutout: '80%',
				plugins: {
					legend: {
						display: false, // Hide the legend (dataset label)
					},
				},
				afterDraw: function(chart) {
					const ctx = chart.ctx;
					const width = chart.chart.width;
					const height = chart.chart.height;

					ctx.restore();
					ctx.font = "16px Arial";
					ctx.fillStyle = "black";
					ctx.textAlign = "center";
					ctx.textBaseline = "middle";
					const text = "Center Text"; // Replace this with your desired text
					ctx.fillText(text, width / 2, height / 2);
					ctx.save();
					}  
			}
		});

		//도넛 시간 나타내기
		const doughnutWorkTime = Math.floor('${min}' / 60);
		const hours = document.getElementById('hours');
		hours.innerHTML = doughnutWorkTime;

		//밑에 근무시간 나타내기
		const weekWorkTime = Math.floor('${min}' / 60);
		const hour = document.getElementById('hour');
		hour.innerHTML = weekWorkTime;

		//테이블 근무시간 나타내기
		const tableWork =  document.querySelectorAll('.tableWorkTime');
		console.log(tableWork);
		for(let i = 0; i<= tableWork.length; i++){
			const workMinuteList = '${workMinuteList}'
			const workMinuteListArr = JSON.parse(workMinuteList);
			const tableWorkTime = Math.floor(workMinuteListArr[i + 1] / 60);
			const tableWorkMinute = Math.floor(workMinuteListArr[i + 1] % 60);
			tableWork[i].innerHTML = tableWorkTime +'시간' +tableWorkMinute +'분';
		}
			
    </script>

</body>
</html>