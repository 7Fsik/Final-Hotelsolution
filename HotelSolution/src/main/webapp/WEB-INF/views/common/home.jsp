<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>로그인 후 메인 화면 </title>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/main.jsp" %>
		<link rel="stylesheet" href="${root}/resources/css/common/home.css">
		<script defer src="${root}/resources/js/common/header.js"></script>
		<!-- fullcalendar CDN -->
		<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
		<!-- fullcalendar 언어 CDN -->
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
		<div id="mainboard">
			<div class="main-board-container">
				<div class="commute-box">
					<div class="calender-container" >
						<div class="quick-mail-title">
							<h1 id="workout-btn" onclick="goworkPage();">통근관리</h1>
						</div>
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
										<span><button id="startBtn" onclick="startClock();">출근</button></span>
										<span><button id="endBtn" onclick="stopClock();">퇴근</button></span>
										<span class="text">버튼을 눌러 출근시간을 기록하세요</span>
									</div>
								</div>
						</div>			
						<div class="menu-img">
							<img alt="" src="${root}/resources/img/일하는사람.jpeg">
						</div>			
					</div>		
            	</div>
				</div>
				<div class="calendar-box">
					<!-- calendar 태그 -->
					<div id='calendar-container'>
						<div class="quick-mail-title">
							<h1 id="calender-btn" onclick="gocalenderPage();">통근관리</h1>
						</div>
						<div id='calendar'>

						</div>
					</div>

				</div>
				<div class="mail">
					<div class="quick-mail-title">
						<h1>메일함</h1>
					</div>

					<!-- Category buttons -->
					<div class="btn-group" role="group" aria-label="Mail categories">
						<button type="button" class="btn btn-secondary" onclick="showReceivedMails()">받은 메일함</button>
						<button type="button" class="btn btn-secondary" onclick="showUnreadMails()">안읽은 메일함</button>
						<button type="button" class="btn btn-secondary" onclick="showSentMails()">보낸 메일함</button>
					</div>

					<!-- Received Mails -->
					<div class="quick-mail-view-container received-mails">
						<h1>좋아요</h1>
					</div>

					<!-- Unread Mails -->
					<div class="quick-mail-view-container unread-mails" style="display: none;">
						<h2>부트스트랩</h2>
					</div>

					<!-- Sent Mails -->
					<div class="quick-mail-view-container sent-mails" style="display: none;">
						<h2>보낸메일함</h2>
					</div>
				</div>
				<div class="board-box">
					<div class="quick-mail-title">
						<h1>게시판</h1>
						<div id="board-list"></div>
					</div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>

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
						let title = '<span class="title">' + item.title + '</span>';
						let content = '<span class="content ml-3">' + item.content + '</span>';

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

	const graphData = [
		workMinuteListArr[1] / 60,
		workMinuteListArr[2] / 60,
		workMinuteListArr[3] / 60,
		workMinuteListArr[4] / 60,
		workMinuteListArr[5] / 60,
		10,
		10,
	];
	myChart.data.datasets[0].data = graphData;
	myChart.update();

	function goworkPage(){
		window.location.href =  "${root}/workout/attendance";
	}


	function gocalenderPage(){
		window.location.href="${root}/schedule/calendar";
	}

	



	
</script>