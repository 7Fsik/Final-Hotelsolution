<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
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
</head>
<style>

	.fc-sticky{
					color: white;
				}
				
				/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
				.fc-header-toolbar {
					padding-top: 1em;
					padding-left: 1em;
					padding-right: 1em;
				}

				/* 일요일 날짜 빨간색 */
				.fc-day-sun a {
				color: red;
				text-decoration: none;
				}

				/* 토요일 날짜 파란색 */
				.fc-day-sat a {
				color: blue;
				text-decoration: none;
				}
	
	.modalWrap {
	  display: none;
	  position: fixed;
	  margin:200px;
	  z-index: 1;
	  left: 0;
	  top: 0;
	   width: 410px;
        height: 510px;
        grid-template-rows: 1fr 1fr 8fr;

        border: 5px solid #3B444B;
        border-radius: 30px;
        box-sizing: border-box;
        background-color:  white;
	}
	
	
	.close {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	  cursor: pointer;
	}
	
	.close:hover,
	.close:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
	 body{
        box-sizing: border-box;
        margin: 50px;
    }
    

    img{
        width: 360px;
        height: 40px;
    }

    .modalWrap > div{
        margin: 5px;
    }
    
    .logo{
        
        text-align: center;
    }

    .textArea{
        text-align: center;
        font-weight: bold;
        font-size: 30px;
    }

    .formArea{
        height: 390px;
        display: grid;
        grid-template-columns: 3fr 1fr;
        grid-template-rows: 1fr 1fr 3fr 1fr;
    }
    
    form  div{
        margin: 5px;
    }

    .scheduleDate{
        text-align: center;
        font-size: 20px;

    }
   
    .scheduleType{
        text-align: center;
        
    }
    
    .scheduleName{
        
        grid-column: span 2;
    }

    .scheduleTypeSelect{
        margin: auto;
        height: 30px;
        background-color: #3B444B ;
        color: white;
        font-weight: bold;
    }
    
    .scheduleContentArea{
        grid-column: span 2;
        width: 380px;
    }
    .shcheduleContent{
        margin: auto
        
    }
    .scheduleSubmitBtn{
        grid-column: span 2;
        text-align: center;
    }
    .sbtn{
        text-align: center;
        width: 100px;
        height: 50px;

        background-color: #3B444B;
        color: white;
        border: 0px;
    }
    #calendar{
    	margin-top : 10vh;
    	margin-left : 10vw;
    	width:80cw;
    	height:80vh;
    }
    .modalbtn{
    	text-align: right;
    	margin-right: 12vw;
    }
</style>
<body>
	
	  	<!-- calendar 태그 -->
			<div id='calendar-container'>
				<div id='calendar'></div>
			</div>
			<script>
				
				function getRandomColor() {
					var letters = '0123456789ABCDEF';
					var color = '#';
					for (var i = 0; i < 6; i++) {
						color += letters[Math.floor(Math.random() * 16)];
						if(color == '#ffffff'){
							return color;
						}
					}
					return color;
				}

				var randomColor = getRandomColor(); // 랜덤 색상 생성

				(function () {
					$(function () {
						// calendar element 취득
						var calendarEl = $('#calendar')[0];
						// full-calendar 생성하기
						var calendar = new FullCalendar.Calendar(calendarEl, {
							height: '700px', // calendar 높이 설정
							expandRows: true, // 화면에 맞게 높이 재설정
							slotMinTime: '08:00', // Day 캘린더에서 시작 시간
							slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
							// 해더에 표시할 툴바
							headerToolbar: {
								left: 'prev,next today',
								center: 'title',
								right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
							},
							initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
							// initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
							navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
							editable: true, // 수정 가능?
							selectable: true, // 달력 일자 드래그 설정가능
							nowIndicator: true, // 현재 시간 마크
							dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
							locale: 'ko', // 한국어 설정
							
							eventAdd: function (obj) { // 이벤트 추가(드래그))
								const params = [];
								params.push("write")
								params.push(obj.event.title);
								params.push(obj.event.start);
								params.push(obj.event.end);

								$.ajax({
									url: '/fire/schedule/calendar',
									type: 'post',
									data: {
										params: JSON.stringify(params)
									},
									error: function () {
										alert("error");
									}
								});
							},
							eventChange: function (obj) { // 이벤트 수정(이벤트 드래그)
								const params = [];
								params.push("modify")
								params.push(obj.event.title);
								params.push(obj.event.start);
								params.push(obj.event.end);

								$.ajax({
									url: '/fire/schedule/calendar',
									type: 'post',
									data: {
										params: JSON.stringify(params)
									},
									error: function () {
										alert("error");
									}
								});
							},
							eventClick: function (obj) { // 이벤트 삭제 (이벤트 클릭)
								var result = confirm('이 일정을 삭제하시겠습니까?');

								if (result == true) {
									const params = [];
									params.push("delete")
									params.push(obj.event.title);
									params.push(obj.event.start);
									params.push(obj.event.end);

									$.ajax({
										url: '/fire/schedule/calendar',
										type: 'post',
										data: {
											params: JSON.stringify(params)
										},
										success: function() {
											location.reload();
										},
										error: function () {
											alert("error");
										}
									});
								}
							},

							
							select: function (arg) { // 드래그 or 클릭으로 이벤트 생성
								var title = prompt('일정을 입력해주세요');
								if (title) {
									calendar.addEvent({
										title: title,
										start: arg.start,
										end: arg.end,
										allDay: arg.allDay,
										backgroundColor: randomColor // 배경색 지정
									});
								}
								calendar.unselect()
							},
							// 이벤트 
							events: [
								<c:forEach items="${voList}" var="vo">
									{
									title: '${vo.title}',
									start: '${vo.startDate}',
									end: '${vo.endDate}',
									backgroundColor: getRandomColor()
									},
								</c:forEach>
							]
						});



						// 캘린더 랜더링
						calendar.render();
					});
				})();
			</script>
		
	<div class="modalWrap">
		

        <div class="logo">
            <img src="<%= request.getContextPath() %>/WEB-INF/common/logo/hsLogo.JPG" alt="로고입니다">
              <span class="close">&times;</span>
        </div>
        <div class="textArea">
            일정 등록
        </div>
        <form action="">
            <div class="formArea">
          
                <div class="scheduleDate">
                    2023.07.11 ~ 2023.08.11
                    
                </div>
                <div class="scheduleType">
                    <select name="scheduleTypeNo" class="scheduleTypeSelect">
                        <option disabled selected hidden value="" class="disabled">일정타입</option>
                        <option value="1">휴가</option>
                        <option value="2">팀일정</option>
                        <option value="3">업무일정</option>
                        <option value="4">사생활</option>
                    </select>
                </div>
                <div class="scheduleName">
                    일정 이름 : <br><input type="text" name="title" placeholder="일정 이름을 입력하세요" style="width: 370px; height: 20px;" >
                </div>
                <div class="scheduleContentArea">
                    일정 내용 : <br> <textarea name="content" class="shcheduleContent" placeholder="일정 내용을 입력하세요" style="width: 370px; height: 150px; resize: none; overflow: auto;" ></textarea>
                </div>
                <div class="scheduleSubmitBtn">
                    <button type="submit" class="sbtn">등록하기</button>
                  
                </div>
           
            </div>
        </form>
        

    </div>
</body>
<!-- 
<script type="text/javascript">
	let openModal = document.querySelector(".modalBtn");
	
	let modal = document.querySelector(".modalWrap");
	let closeModal = document.querySelector(".close");
	
	openModal.addEventListener("click", function() {
	  modal.style.display = "grid";
	});
	
	closeModal.addEventListener("click", function() {
	  modal.style.display = "none";
	});

</script>
 -->

</html>