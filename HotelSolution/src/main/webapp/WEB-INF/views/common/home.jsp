<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>로그인 후 메인 화면 </title>
</head>
<style>
 	.menu-bar{
 		
        width: 500px;
        height: 250px;
        border: 1px solid white;
        border-radius: 10px;
        background-color: white;
        cursor: pointer;
 	}
 	#commuteText{
		position: relative;
		top:15px;
		left:20px
	}
	  .table-title{
    	font-size:0.8em;
		font-weight:bold;
    }
      
    .table-content{
    	color : #adb5bd;
		font-size: 15px;
		position:relative;
		top:5px;
    }
    #chartJs{
		display: flex;
		height: 130px;
		justify-content:space-evenly;
	}
		
	#myChart{
		position:relative;
		top:25px;
	}
		#doughnut-chart{
		position:relative;
		bottom:20px;
		width:160px;
		height:160px;
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
	.graphEle{
		display:flex;
		justify-content: space-evenly;
		align-items: center;
		width: 500px;
		margin: auto;
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
	.calendar-box {
    display: flex;
    padding: 20px;
    font-size: 30px;
    grid-column: 2 / 3; /* 두 번째 열에 배치합니다. */
    grid-row: 1 / 2;    /* 첫 번째 행에 배치합니다. */
    background-color: #ffffff;
    border-radius: 10px;
    width : 650px;
}

.mainScheduleList{
	height : 320px;
	overflow-y:auto; 
	width: 600px;
}



#calender-btn:hover{
	cursor: pointer;
}

.scheduleListByONe:hover{
		background-color: rgba(59, 68, 75, 0.2);
		cursor: pointer;
}


.commute-box {
    display: flex;
    padding: 20px;
    font-size: 30px;
    font-weight: bold;
    grid-column: 1 / 2; 
    grid-row: 1 / 2;  
    background-color: #ffffff;
    border-radius: 10px;
    width : 650px;
}
.dataListTop{
		display:grid;
		grid-template-columns: 7fr 7fr  5fr;
		border: 1px solid #3b444b;	
		box-sizing: border-box;
		background-color: #3b444b;
		font-weight:bold;
		font-size: 20px;
		color: white;
	}
 .bbrt{
		/*border-right: 1px solid #3b444b;*/
		white-space: nowrap; /* 한 줄로 텍스트 표시 */
	    overflow: hidden; /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
	   text-align: center;
	}  
   .dataList{
		display:grid;
		grid-template-columns:  7fr 7fr  5fr;
		
		box-sizing: border-box;
	
	}
	.dtLWrap:hover{
		cursor: pointer;
		background-color: rgba(59, 68, 75, 0.2);
	}
	.dataList > div{
		width:100%;
		height: 30px;
		font-size: 15px;
		box-sizing: border-box;
		white-space: nowrap; /* 한 줄로 텍스트 표시 */
	    overflow: hidden; /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
	    
	}  
		.bbr{
		/*border-right: 1px solid #3b444b;*/
		white-space: nowrap; /* 한 줄로 텍스트 표시 */
	    overflow: hidden; /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
	    cursor: pointer;
	    height: 30px;
	}
	.dataListBody{
		height:300px;
		overflow-y: auto; 
	}
	.dtLWrap{
	display:grid; 
	grid-template-rows:1fr 1fr;
	 border:1px solid rgba(59, 68, 75, 0.3); 
	 border-radius:10px;
	 height:60px;
	}
</style>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/main.jsp" %>
		<link rel="stylesheet" href="${root}/resources/css/common/home.css">
		<script defer src="${root}/resources/js/common/header.js"></script>
		<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
		<meta name="viewport"
		content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
		<!-- jquery CDN -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- fullcalendar CDN -->
		<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
		<!-- fullcalendar 언어 CDN -->
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
		<!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Bootstrap JS 및 팝업 기능을 사용하기 위한 jQuery -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- 차트 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<div id="mainboard">
			<div class="main-board-container">
				<div class="commute-box">
					<div class="calender-container" style="width: 500px;" >
						<div class="quick-mail-title" onclick="goworkPage();">
							<h1 id="workout-btn" >통근관리</h1>
						</div>
						<div style="height:50px;">
						<div style="display: grid; grid-template-columns:4fr 1fr 1fr; grid-gap:10px;">
								<div class="secend-menu">
									<div class="work-time">
										<div class="work-time-text">근무 시간
											<span id="time">00</span>
											<span>:</span>
											<span id="min">00</span>
											<span>:</span>
											<span id="sec">00</span>
											</div>
									</div>
								</div>
									<div class="work-btn">
										<span><button id="startBtn" onclick="startClock();">출근</button></span>
									</div>
										<div class="work-btn"><span><button id="endBtn" onclick="stopClock();">퇴근</button></span></div>
						</div>			
					</div>	
					 <div class="menu-bar" onclick="goworkPage()">
		            	<div id="commuteText">
			            	<div class="table-title">주간 근무시간</div>
							<div class="table-content">${sessionScope.loginMember.name}님의 주간 근무내역입니다.</div>
		            	</div>
		            	
		            	<div id="chartJs">
			                <canvas id="myChart" width="250" height="120"></canvas>
							<div style="position: relative">
								<canvas id="doughnut-chart"></canvas>
								<div class="center-text">주간 근무시간 <br><br><span id="hours" class="number"></span> 시간 <span class="number">${min%60}</span>분</div>
							</div>
		            	</div>
		                <hr>
						<div class="graphEle">
							<div class="blueCircle"></div>
							<div class="circleContent">근무시간</div>
							<div class="CurworkTime">주간 근무시간</div>
							<div class="CurworkTimeText"  style="font-size: 20px;"><span id="hour" style="font-size: 20px;"></span>시간 ${min%60}분</div>
							<div class="workTime">총 근무시간</div>
							<div class="workTimeText" style="font-size: 20px;">40시간 0분</div>
						</div>
		            </div>	
            	</div>
				</div>
				<!-- 여기까지 통근 -->
				
				
				<div class="calendar-box">
					<!-- calendar 태그 -->
					<div id='schedule-container'>
						<div class="quick-mail-title">
							<h1 id="calender-btn" onclick="gocalenderPage();">일정</h1>
						</div>
						<div style="width: 650px;">
							<div class="mainScheduleList">
							
							</div>
					  
								
						</div>
					</div> 

				</div>
				
				
				
				
				
			
							 
				<div class="mail">
					<div class="quick-mail-title">
						<h1>개인 자료실</h1>
					</div>
					<div style="width: 550px;">
						<div class="dataListTop">
								<div class="bbrt">제목</div>
								<div class="bbrt">첨부파일</div>
								<div class="bbrt">작성일</div>
							</div>
							<div class="dataListBody">
							<c:if test="${not empty dataVoList}">
								<c:forEach items="${dataVoList}" var="dataVo" varStatus="status">
									<div class="dtLWrap">
									    <div class="dataList" onclick="goDetail(${dataVo.dataNo},${dataVo.securityLevel},${loginMember.positionNo},${dataVo.writerNo},${loginMember.no})">
									        <div class="bbr" style="padding-left: 10px;">
									            <c:if test="${not empty dataVo}">
									                ${dataVo.title}
									            </c:if>
									        </div>
									        <div class="bbr">
									            <c:if test="${not empty dataVo}">
									                (총 ${dataVo.fileCnt}개) ${dataVo.firstFile} 
									            </c:if>
									        </div>
									        <div style="padding-right: 2px;">
									            <c:if test="${not empty dataVo}">
									                ${dataVo.enrollDate}
									            </c:if>
									        </div>
									    </div>
									    <div style="height: 30px; font-size: 15px; padding-left: 10px;">
									    	<c:if test="${not empty dataVo}">
									              내용 :  ${dataVo.content}
									            </c:if>
									    </div>
								    </div>
								    <hr>
								</c:forEach>
							</c:if>
							</div>

					</div>
					
				</div>
				
				
				
				
				
				
				
				<div class="board-box">
					<div class="quick-mail-title">
						<h1>게시판</h1>
						<div id="board-list">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




<script>
	$(document).ready(function () {
		function getTopBoardList() {
			$.ajax({
				url: "${root}/board/getList",
				type: "GET",
				dataType: 'json',
				success: function (data) {
					console.log(data);
					$('#board-list').empty();
					$.each(data, function (index, item) {
						let hiddenNo = '<span class="hidden-no" style="display:none;">' + item.no + '</span>';
						let title = '<span class="title"> 제목 : ' + item.title + ' </span>';
						let content = '<span class="content ml-3"> 내용 :' + item.content + '</span>';

						let postWrapper = '<div class="single-post-wrapper border rounded p-3 mb-4 d-flex" data-url="' + "YOUR_ROOT_URL" + '/board/detail?no=' + item.no + '">' + hiddenNo + title + content + '</div>';
						$('#board-list').append(postWrapper);
					});
					$('#board-list > div').css({ 'width' : '550px','height': '25px', 'line-height': '15px', 'overflow': 'hidden' ,'font-size' : '15px' });
				},
				error: function (jqXHR, textStatus, errorThrown) {
					console.log(textStatus, errorThrown);
				}
			});
		}

		getTopBoardList();
		setInterval(getTopBoardList, 300000);
	});
	// 5 minutes = 300000 milliseconds
	

 
    
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
		const endBtn = document.querySelector('#endBtn');
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
							endBtn.disabled = true;
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
		
//////////////////////


	
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
				'${workMinuteList[1]}'/60,'${workMinuteList[2]}'/60,'${workMinuteList[3]}'/60,'${workMinuteList[4]}'/60,'${workMinuteList[5]}'/60 , 10 , 10]
			}],

		};

		const config = {
			type: 'bar',
			data: data,
			options: {
				responsive:false,
				scales: {
				 
				  y: {
					display: false, 
					
				  } 
				},
				plugins: {
      legend: {
        display: false, 
        padding: 10,
      },
      tooltip: {
        filter: function (tooltipItem) {
          return tooltipItem.dataIndex !== 5 && tooltipItem.dataIndex !== 6;
        },
      },
    },
    tooltips: {
      mode: 'index',
      intersect: false,
    },
    barPercentage: 0.7, 
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
						display: false, 
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
					const text = "Center Text"; 
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


		myChart.update();

		getScheduleList();
////////////////////////
/* 일정 가져오기 */
	function getScheduleList() {
	    const mainScheduleList = document.querySelector('.mainScheduleList');
	    $.ajax({
	        type: 'post',
	        url: '${root}/schedule/list',
	        data: {},
	        success: function(data) {
	            let scheduleStr = '';
	


                for (let i = 0; i < data.length; i++) {
	                let sss = data[i].endDate.substring(0, 10); // "2023-08-15"
	                let originalDate = new Date(sss);
	                originalDate.setDate(originalDate.getDate() - 1);
	                let formattedDate = originalDate.getFullYear() + '-' +
	                ('0' + (originalDate.getMonth() + 1)).slice(-2) + '-' +
	                ('0' + originalDate.getDate()).slice(-2);
	            	const shortenedTitle = data[i].title.length > 20 ? data[i].title.substring(0, 20) + '...' : data[i].title;
	                
	                scheduleStr += '<div onclick="gocalenderPage();" class="scheduleListByONe" style="display:grid; grid-template-columns:1fr 2fr 3fr; grid-gap:10px; margin-left:15px; padding-left:5px; width:550px; border-radius:10px;">'
	                 	+ '<div><img style="border-radius:50px; width:60px; height:60px; "alt="" src="${root}/resources/img/member/profile/'+data[i].writerImage+'"></div>'
	                 	+ '<div style="display:grid; grid-template-rows:1fr 1fr;">'
	                    + '<div style="font-size:15px; "> 타입 : ' + data[i].typeName + '</div>'
	                    + '<div style="font-size:15px; "> 작성자 : ' + data[i].writerName + '</div></div>'
	                	+ '<div style="display:grid; grid-template-rows:1fr 1fr;">'
                        + '<div style="font-size:15px; "> 기간 : ' + data[i].startDate.substring(0, 10) +'~'+ formattedDate+'</div>'
	                    + '<div style="font-size:15px; "> 제목 : ' + shortenedTitle + '</div></div></div></br>';
	            }
	            mainScheduleList.innerHTML = scheduleStr;
	
	            console.log(data);
	        },
	        error: function(e) {
	            console.log(e);
	            alert('통신 실패');
	        }
	        
	    });
	}



function goDetail(drvoNo,drvoLevel,loginMemberLevel,writerNo,loginMemberNo) {
		
		if(drvoLevel<=loginMemberLevel){
			  if (typeof drvoNo !== 'undefined') {
				    window.location.href = '${root}/dataroom/detail?drvoNo=' + drvoNo;
				  }
		}else if(writerNo==loginMemberNo){
			if (typeof drvoNo !== 'undefined') {
			    window.location.href = '${root}/dataroom/detail?drvoNo=' + drvoNo;
			  }
		}else{
			alert("보안등급 이하입니다.");
		  event.preventDefault();
		}
	
	}

	function goworkPage(){
		window.location.href =  "${root}/workout/attendance";
	}


	function gocalenderPage(){
		window.location.href="${root}/schedule/calendar";
	}

	




</script>
</body>
</html>
