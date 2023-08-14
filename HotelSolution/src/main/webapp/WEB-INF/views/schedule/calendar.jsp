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
		<title>일정</title>
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
		.fc-daygrid-day-frame:hover{
			 background-color: rgba(59, 68, 75, 0.2); 
			 cursor: pointer;
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


.modal-footer .btn-danger {
  background-color: #dc3545;
  color: #fff;
}

.modal-footer .btn-danger:hover {
  background-color: #c82333;
}

#mainboard{

background-color:  white;
border-radius: 20px;
}
#calendar-container{
	margin :10px;
	
}

.fc-event-time{
	display:none;
}
.fc-toolbar-title{
	color : black;
}
.fc-event-title-container{
	cursor: pointer;
}



 .create {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 9999;
  width: 410px;
  height: 510px;
  display: grid;
  grid-template-rows: 1fr 1fr 8fr;
  border: 5px solid #3B444B;
  border-radius: 30px;
  box-sizing: border-box;
  background-color: #fff; /* 모달 배경색 추가 (기본값은 흰색) */
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); /* 모달 그림자 효과 추가 */
  visibility: hidden; /* 초기에 숨기기 위해 추가 */
  opacity: 0; /* 초기에 투명도 0으로 설정하여 숨기기 위해 추가 */
  transition: visibility 0s, opacity 0.3s; /* 모달 보이기/숨기기 시간 설정 */
}

    .logo img{
        width: 360px;
        height: 40px;
    }

    .create > div{
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
        cursor: pointer;
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
				 
				 
				</div>
		    </div>
		  </div>
		</div>
		<!-----------create----->
		<div class="create">
	        <div class="logo">
	            <img src="${root}/resources/img/호텔솔루션.png" alt="로고입니다">
	        </div>
	        <div class="textArea">
	            일정 등록
	        </div>
		        <form action="${root}/schedule/create" method="post" class="creatForm">
		            <div class="formArea">
		          
		                <div class="scheduleDate">
		                   
		                    
		                </div>
		                <!-- ... 이전 코드 생략 ... -->
		
						<div class="scheduleType">
						    <select name="scheduleTypeNo" class="scheduleTypeSelect" id="scheduleTypeSelect">
						        <option  disabled selected value="" class="disabled">일정타입</option>
						        <option  value="1">휴가</option>
						        <option value="2">팀일정</option>
						        <option value="3">업무일정</option>
						        <option value="4">사생활</option>
						    </select>
						</div>
						<div class="scheduleName">
						    
						</div>
						<div class="scheduleContentArea">
						    일정 내용 : <br> <textarea name="content" class="shcheduleContent" placeholder="일정 내용을 입력하세요" style="width: 370px; height: 150px; resize: none; overflow: auto;"></textarea>
						</div>
					
						<div class="scheduleSubmitBtn">
						    <button type="button" class="sbtn" id="submitButton">등록하기</button>
							<button type="button" class="sbtn" id="closeButton">닫기</button>
						</div>
		
		
		
		           
		            </div>
		        </form>
        
	
	    </div>
			
	
	   </div>

</div>
			
<script>
	document.getElementById("submitButton").addEventListener("click", function () {
	    // 선택한 일정 타입을 가져옴
	    const selectedValue = document.querySelector("#scheduleTypeSelect").value;
	    
	    // 일정 타입이 선택되지 않은 경우 알림창 띄움
	    if (selectedValue === "") {
	        alert("일정 타입을 선택해주세요.");
	    } else {
	        // 일정 타입이 선택된 경우 폼을 제출
	        document.querySelector(".creatForm").submit();
	    }
	});
	document.getElementById('closeButton').addEventListener('click', function() {
	    document.querySelector('.create').style.visibility = 'hidden';
	    document.querySelector('.create').style.opacity = '0';
	    location.reload();
	  });
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
				height: '800px', // calendar 높이 설정
				expandRows: true, // 화면에 맞게 높이 재설정
				slotMinTime: '10:00', // Day 캘린더에서 시작 시간
				slotMaxTime: '18:00', // Day 캘린더에서 종료 시간
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
					   
			            
					    // AJAX를 통해 서버로 데이터 전송
					    $.ajax({
					        url: '${root}/schedule/calendar/create',
					        type: 'get',
					        data: {
					            params: JSON.stringify(params)
					        },
					        success: function (data) {
					            // 성공적으로 데이터를 추가한 경우, 모달에 내용을 채웁니다.
					            console.log(data);
					             let scheduleDate = document.querySelector('.scheduleDate');
					             let scheduleName = document.querySelector('.scheduleName');
					          
					            let ostr = "";
					            let ostr2 = "";
								let end = data.endDate-1;
								let sd= data.startDate;
								let edi= data.endDate-1;
								let ed = String(edi); // 또는 ed.toString();
								
								let syear = sd.substring(2, 4);
								let smonth = sd.substring(4, 6);
								let sday = sd.substring(6, 8);
					
								

								// 결과 문자열 생성
								let sStartDate = syear+'년' +smonth+'월'+sday+'일';
								
								let eDateyear = ed.substring(2, 4);
								let eDatemonth = ed.substring(4, 6);
								
								let eDateday = ed.substring(6, 8);

								// 결과 문자열 생성
								let eEndDate = eDateyear+'년' +eDatemonth+'월'+eDateday+'일';
								
					            // 데이터를 가공하여 모달에 출력할 HTML 형식으로 만듭니다.
					            ostr+= '<div><input name="startDate" value="'+data.startDate+'" hidden> <input name="endDate" value="'+edi+'" hidden>'+
					            	sStartDate + "~" +eEndDate+"</div>";
					            console.log(ostr);
					            ostr2+='일정 이름 : <br><input type="text" name="title" placeholder="일정 이름을 입력하세요" value="'+data.title+'" style="width: 370px; height: 20px;">'
					            // 모달에 내용을 삽입합니다.
					         	scheduleDate.innerHTML = ostr;
					            scheduleName.innerHTML = ostr2;
					            // 모달을 보여줍니다.
					            document.querySelector('.create').style.visibility = 'visible';
								document.querySelector('.create').style.opacity = '1';
								
					        },
					        error: function () {
					            alert("이벤트 추가에 실패하였습니다.");
					        }
					    });
		
					    calendar.unselect()
					  
						
						
					},

				eventClick: function (obj) { // 이벤트 삭제 (이벤트 클릭)

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
					      const modalFooter = detailModal.find('.modal-footer');
					      let ostr = "";
					      let ostr2 = "";
							const startDate = data.startDate;
							const year = startDate.substring(0, 4);
							const month = startDate.substring(4, 6);
							const day = startDate.substring(6, 8);
				
							

							// 결과 문자열 생성
							const dataStartDate = year+'년' +month+'월'+day+'일';
							
							const endDate = data.endDate;
							const endDateyear = endDate.substring(0, 4);
							const endDatemonth = endDate.substring(4, 6);
							const endDateday = endDate.substring(6, 8);


							// 결과 문자열 생성
							const dataEndDate = endDateyear+'년' +endDatemonth+'월'+endDateday+'일'
					      // 데이터를 가공하여 모달에 출력할 HTML 형식으로 만듭니다.
					     
					        ostr += '<div class="memberVoList">' +
					          '<div class="bbr" style="text-align:center; font-size:25px;">'+  dataStartDate + '~'+ dataEndDate+ '</div>' +
					          '<div class="bbr">작성자 : '+ data.writerName + '</div>' +
					          '<div class="bbr">타입 : '+  data.typeName +'</div>' +
					          '<div class="bbr" >제목 : ' + data.title + '</div>' +
					          '<div class="bbr" >내용 : ' + '<'+data.typeName+'>'+'</div>' +
					          '<div class="dcontent" style="width:400px; height:300px; overflow: scroll; word-wrap: break-word; padding-left:20px;">   ' + data.content + '</div>' +
					          '</div>';
					   		
					        ostr2 += ' <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>'+
					        	' <button type="button" class="btn btn-danger" id="deleteButton" onclick="deleteSchedule('+data.no 
					        			+')">삭제</button>'

					      // 모달에 내용을 삽입합니다.
					      detailContent.html(ostr);
					       modalFooter.html(ostr2);
					      // 모달을 보여줍니다.
					      detailModal.modal('show');
					    },
					    error: function () {
					      alert("수정 또는 삭제된 일정입니다.");
					    }
					  });
					
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
					        backgroundColor: 'coral'
					        },
					    </c:if>
					    <c:if test="${my.scheduleTypeNo==3}">
					        {
					        title: '${my.title}',
					        start: '${my.startDate}',
					        end: '${my.endDate}',
					        backgroundColor: 'lightgray'
					        },
					    </c:if>
				        <c:if test="${my.scheduleTypeNo==4}">
					        {
					        title: '${my.title}',
					        start: '${my.startDate}',
					        end: '${my.endDate}',
					        backgroundColor: 'skyblue'
					        },
					    </c:if>
					    <!-- 추가적인 조건에 따른 데이터 처리 -->
					</c:forEach>

					<c:forEach items="${teamList}" var="team">
						{
						title: '${team.title}',
						start: '${team.startDate}',
						end: '${team.endDate}',
						backgroundColor: 'crimson'
						},
					</c:forEach>
				]
			});



			// 캘린더 랜더링
			calendar.render();
		});
	})();
	
	function deleteSchedule(no) {
		  $.ajax({
		    url: '${root}/schedule/calendar/delete',
		    type: 'post',
		    data: {
		      no: JSON.stringify(no)
		    },
		    dataType: 'json', // JSON 데이터로 처리하기 위한 설정
		    success: function (x) {
		    	alert(x);
		      location.reload();
		    },
		    error: function (e) {
		      alert('작성자만 삭제가 가능합니다');
		      alert(e);
		      location.reload();
		    }
		  });
		}
	

</script>
</body>

</html>