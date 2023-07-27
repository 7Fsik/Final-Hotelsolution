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
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Bootstrap JS 및 팝업 기능을 사용하기 위한 jQuery -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		
	<style>
		/* body 스타일 */
		html,
		body {
			font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			font-size: 14px;
		}
		
		/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
		.fc-header-toolbar {
			padding-top: 1em;
			padding-left: 1em;
			padding-right: 1em;
		}

		/* 일요일 날짜 빨간색 */
		.fc-day-sun a {
		color: red !important;
		text-decoration: none;
		}

		/* 토요일 날짜 파란색 */
		.fc-day-sat a {
		color: blue !important;
		text-decoration: none;
		}

/* Modal 내부 CSS */
.modal-content {
  border: none;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
}

.modal-header {
  background-color: #f0f0f0;
  border-bottom: none;
  padding: 10px;
}

.modal-title {
  font-weight: bold;
  font-size: 1.2rem;
}



.modal-body {
  padding: 20px;
}

.detail-content {
  max-height: 400px;
  overflow-y: auto;
}

/* Modal 내부 컨텐츠 스타일 */
.memberVoList {
  margin-bottom: 10px;
}

.memberVoList > div {
  padding: 5px;
}

.bbr {
  font-weight: bold;
}

/* Modal 닫기 버튼 스타일 */
.modal-footer {
  border-top: none;
  padding: 10px;
}

.modal-footer .btn-secondary {
  background-color: #007bff;
  color: #fff;
}

.modal-footer .btn-secondary:hover {
  background-color: #0056b3;
}
#mainboard{

background-color:  #3B444B;
border-radius: 20px;
}
#calendar-container{
	margin :10px;
	
}
.fc-event-time{
	display:none;
}
.fc-toolbar-title{
	color : white;
}

</style>
	
</head>

<body>
	<div id ="wrap">

   <%@ include file="/WEB-INF/views/common/main.jsp" %>

   <div id="mainboard">
	
	     <!-- calendar 태그 -->
		<div id='calendar-container'>
			<div id='calendar'>
				<form id="myForm" action="${root}/schedule/calendar" method="post">
				    <input type="hidden" name="params" id="paramsInput">
				</form>
			</div>
		</div>
   	<!-- 모달 창 -->
		<div class="modal fade" id="eventDetailModal" tabindex="-1" aria-labelledby="eventDetailModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="eventDetailModalLabel">일정 상세 정보</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div class="detail-content">
		         
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>

   </div>

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
				
				eventAdd: function (obj) { // 이벤트 추가(드래그)
				
					let endDateString = obj.event.end;
					let end = new Date(endDateString);
					end.setDate(end.getDate() + 1);
					
					let startDateString = obj.event.start;
					let start = new Date(startDateString);
					start.setDate(start.getDate() + 1);
				    const params = [];
				    params.push("write");
				    params.push(obj.event.title);
				    params.push(start);
				    params.push(end);

				    // JSON 데이터를 숨겨진 input 요소에 설정
				    document.querySelector("#paramsInput").value = JSON.stringify(params);

				    // form을 제출하여 페이지 이동
				    document.querySelector("#myForm").submit();
				},

				eventMouseLeave: function(obj) {
					
					let endDateString = obj.event.end;
					let end = new Date(endDateString);
					end.setDate(end.getDate() + 1);
					
					let startDateString = obj.event.start;
					let start = new Date(startDateString);
					start.setDate(start.getDate() + 1);
					  const params = [];
					  params.push("detail");
					  params.push(obj.event.title);
					  params.push(start);
					    params.push(end);

					  $.ajax({
					    url: '${root}/schedule/calendar/detail',
					    type: 'post',
					    data: {
					      params: JSON.stringify(params)
					    },
					    success: function (data) {
					      // 성공적으로 데이터를 가져온 경우 모달에 내용을 채웁니다.
					      const detailModal = $('#eventDetailModal');
					      const detailContent = detailModal.find('.detail-content');
					      let ostr = "";

					      // 데이터를 가공하여 모달에 출력할 HTML 형식으로 만듭니다.
					     
					        ostr += '<div class="memberVoList">' +
					          '<div class="bbr" style="text-align:center; font-size:25px;">'+  data.startDate + '~'+ data.endDate+ '</div>' +
					          '<div class="bbr">작성자 : '+ data.writerName + '</div>' +
					          '<div class="bbr">타입 : '+  data.typeName +'</div>' +
					          '<div class="bbr" >제목 : ' + data.title + '</div>' +
					          '<div class="bbr" >내용 : ' + '<'+data.typeName+'>'+'</div>' +
					          '<div class="dcontent" style="width:400px; height:300px; overflow: scroll; word-wrap: break-word; padding-left:20px;">   ' + data.content + '</div>' +
					          '</div>';
					   

					      // 모달에 내용을 삽입합니다.
					      detailContent.html(ostr);

					      // 모달을 보여줍니다.
					      detailModal.modal('show');
					    },
					    error: function () {
					      alert("수정 또는 삭제된 일정입니다.");
					    }
					  });
					},

					
					
				    
				
				eventChange: function (obj) { // 이벤트 수정(이벤트 드래그)
					let endDateString = obj.event.end;
					let end = new Date(endDateString);
					end.setDate(end.getDate() + 1);
					
					let startDateString = obj.event.start;
					let start = new Date(startDateString);
					start.setDate(start.getDate() + 1);
					  const params = [];
					  params.push("modify");
					  params.push(obj.event.title);
					  params.push(start);
					    params.push(end);

					  $.ajax({
					    url: '${root}/schedule/calendar',
					    type: 'post',
					    data: {
					      params: JSON.stringify(params)
					    },
					    success: function () {
					      // 성공 시 처리할 코드를 추가하시면 됩니다 (필요하면)
					    },
					    error: function () {
					      alert("작성자만 수정이 가능합니다");
					      location.reload();
					    }
					  });
					},

				
				eventClick: function (obj) { // 이벤트 삭제 (이벤트 클릭)
					var result = confirm('이 일정을 삭제하시겠습니까?');

					if (result == true) {
						
						const params = [];
						let endDateString = obj.event.end;
						let end = new Date(endDateString);
						end.setDate(end.getDate() + 1);
						
						let startDateString = obj.event.start;
						let start = new Date(startDateString);
						start.setDate(start.getDate() + 1);
						params.push("delete");
						params.push(obj.event.title);
						  params.push(start);
						    params.push(end);
						$.ajax({
							url: '${root}/schedule/calendar',
							type: 'post',
							data: {
								params: JSON.stringify(params)
							},
							success: function() {
								location.reload();
							},
							error: function () {
								alert("작성자만 삭제가 가능합니다");
								location.reload();
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
					<c:forEach items="${myList}" var="my">
					    <c:if test="${my.scheduleTypeNo==1}">
					        {
					        title: '${my.title}',
					        start: '${my.startDate}',
					        end: '${my.endDate}',
					        backgroundColor: 'black'
					        },
					    </c:if>
					    <c:if test="${my.scheduleTypeNo==3}">
					        {
					        title: '${my.title}',
					        start: '${my.startDate}',
					        end: '${my.endDate}',
					        backgroundColor: 'orange'
					        },
					    </c:if>
				        <c:if test="${my.scheduleTypeNo==4}">
					        {
					        title: '${my.title}',
					        start: '${my.startDate}',
					        end: '${my.endDate}',
					        backgroundColor: 'red'
					        },
					    </c:if>
					    <!-- 추가적인 조건에 따른 데이터 처리 -->
					</c:forEach>

					<c:forEach items="${teamList}" var="team">
						{
						title: '${team.title}',
						start: '${team.startDate}',
						end: '${team.endDate}',
						backgroundColor: 'blue'
						},
					</c:forEach>
				]
			});



			// 캘린더 랜더링
			calendar.render();
		});
	})();
	
</script>
</body>

</html>