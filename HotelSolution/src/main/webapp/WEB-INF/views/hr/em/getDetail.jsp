<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>Insert title here</title>
<style type="text/css">
  .detailWrap {
    width: 1330px;
    height: 860px;
    border-radius: 20px;
    display: grid;
    grid-template-rows: 1fr 2fr;
    background-color: white;
  }

  .detailBody {
    display: grid;
    grid-template-columns: 1fr 1fr;
  }

  .detailBodyLeft {
    width: 550px;
    height: 470px;
    margin: auto;
    border: 1px solid black;
    border-radius: 20px;
  }

  .detailBodyRight {
    width: 550px;
    height: 470px;
    margin: auto;
    border: 1px solid black;
    border-radius: 20px;
   
    font-size: 12px;
  }

  .detailTable {
    width: 1260px;
    height: 230px;
    margin: auto;
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 40px;
  }

  .dttd {
    padding-left: 20px;
    padding-top: 20px;
    border: 1px solid black;
    height: 55px;
  }

  input {
    border: 0px;
  }

  input:hover {
    background-color: rgba(59, 68, 75, 0.5);
    cursor: pointer;
  }
  #pf{
  	height: 100px;
  	width:100px;
  	border-radius: 50px;
  	
  }
  .detailTop{
  	margin: auto;
  }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  #menu{
    	display:grid;
    	justify-content:center;
    	grid-template-rows: 1fr 1fr 1fr;
		grid-gap: 5px;
		height:440px;
    }

    .menu-bar{

        width: 540px;
        height: 230px;
        border: 1px solid white;
        border-radius: 30px;
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
        width: 500px;
       	height:150px;
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
		width: 540px;
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
    #real{
    	height : 450px;
    }
    
       	.vacList{
   		display:grid;
        grid-template-rows: 4fr 4fr 4fr ;
        gap :10px;
        margin-top : 10px;
         overflow-y: auto;
         height: 400px;
         width: 550px;
   	}
   	
   	.vac{
	padding-top: 10px;
	padding-left:10px;
	display:grid;
	width:540px;
	height:90px;
	grid-template-columns: 1fr 3fr 2fr  ;
       
	
}
.pf{
	width: 50px;
	height: 50px;
	border-radius: 80px;
}
</style>
</head>
<body>
  <div id="wrap">
    <%@ include file="/WEB-INF/views/common/main.jsp" %>
    <div id="mainboard">
      <div class="detailWrap">
        <div class="detailTop">
          <form action="${root}/hr/em/edit" method="post" onsubmit="return totalCheck()">
           
            
              <div style="display: grid; grid-template-columns: 1fr 1fr 3fr 3fr 1fr; border: 1px solid black; border-radius:20px;width: 1200px; height: 230px;">
			        <div style="margin:auto;"><img id="pf" src="${root}/resources/img/member/profile/${vo.changeImage}" alt="${vo.image}"> </div>
			        <div style="display: grid; grid-template-rows: 1fr 2fr 1fr;">
			            <div style="padding-top:20px;"></div>
			            <div style="padding-top:50px;"> ${vo.name} </div>
			            <div> </div>
			        </div>
			        
			        <div style="display: grid; grid-template-rows: 1fr 1fr 1fr 1fr;">
			              <div style="padding-top:20px;">소속 : <input class="tn" type="text" name="teamName" value="${vo.teamName}" readonly> </div>
			            <div style="padding-top:20px;"> 가입일 : ${vo.enrollDate}    </div>
			            <div style="padding-top:20px;"> 연봉 : <input type="text" name="salary" class="sa" value="${vo.salary}" readonly style="text-align: right;">원</div>
			            <div style="padding-top:20px;">직책 : <input class="pn" type="text" name="positionName" value="${vo.positionName}" readonly></div>    
			        </div>
			        <div style="display: grid; grid-template-rows: 1fr 1fr 1fr 1fr;">
			            <div style="padding-top:20px;">사번 :  ${vo.no}</div>
			            <div style="padding-top:20px;">이메일 : <input type="text" class="em" name="email" value="${vo.email}" readonly style="width: 300px;"></div>
			            <div style="padding-top:20px;">휴대폰번호 : <input type="text" class="ph" value="0${vo.id}" name="id" readonly></div>
			            <div style="padding-top:20px;">부서전화번호 : ${vo.teamAddress}</div>
			            
			        </div>
			        <button type="submit" class="editButton" style="display: none; border: 0px; text-align: center; width: 100px; margin: auto;">수정하기</button>
    		</div>
    		 <input class="userNo" name="no" value="${vo.no}" hidden>
    		 <input class="userNo" name="name" value="${vo.name}" hidden>
          </form>
        </div>
        <div class="detailBody">
          <div class="detailBodyLeft">
            <div id="real">

        <div id="menu">
           
            <div class="menu-bar">
            	<div id="commuteText">
	            	<div class="table-title">이번 주 근무시간</div>
					<div class="table-content">${sessionScope.loginMember.name}님의 근태관리 내역입니다.</div>
            	</div>
            	
            	<div id="chartJs">
	                <canvas id="myChart" width="350" height="120"></canvas>
					<div style="position: relative">
						<canvas id="doughnut-chart"></canvas>
						<div class="center-text">이번 주 근무시간 <br><br><span id="hours" class="number"></span> 시간 <span class="number">${min%60}</span>분</div>
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
          <div class="detailBodyRight">
          		<div style="font-size: 20px; text-align: center; border-bottom: 1px solid black; height:50px; padding-top:15px;">휴가 내역</div>
           		<div class="vacList">
					<c:forEach items="${vdvoList}" var="vdvo"> 
						<div class="vac">
							<div class="pfimage" style="display:grid; grid-template-rows: 3fr 1fr;">
								<div><img class="pf" src="${root}/resources/img/member/profile/${vdvo.image}" alt="사진"></div>
								<div>&nbsp;&nbsp;${vdvo.name}</div>
							</div>
							<div style="display:grid; grid-template-rows: 1fr 1fr 2fr;">
								<div style="display:grid; grid-template-columns: 1fr 1fr;">
									<div>제목 : ${vdvo.title}</div>
									<div>부서 : ${vdvo.teamName}</div>
								</div>
								<div>${vdvo.vacationStart} ~ ${vdvo.vacationEnd} </div>
								<div>사유 : ${vdvo.content}</div>
							</div>
							<div style="display:grid; grid-template-rows: 1fr 1fr 1fr 1fr;">
								<div>직책 : ${vdvo.positionName}</div>
								<div>전화번호 : 0${vdvo.id}</div>
								<div>신청일 : ${vdvo.enrollDate}</div>
								<div></div>
							</div>
						</div>
					</c:forEach>
									
								
							
				</div>
         </div>
       </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
  
    const allInputs = document.querySelectorAll(".rd");
    const teamNameInput = document.querySelector(".tn");
    const positionNameInput = document.querySelector(".pn");
    const emailInput = document.querySelector(".em");
    const salaryInput = document.querySelector(".sa");
    const phoneInput = document.querySelector(".ph");

    const originalValues = {}; // 객체를 생성하여 원래 값들을 저장할 변수

	// 초기 원래 값들을 originalValues 객체에 저장
	
	function resetOriginalValue(inputId) {
		  const input = document.querySelector(`[name="${inputId}"]`);
		  input.value = originalValues[inputId];
		}
    function handleInputClick(event) {
      const currentInput = event.target;
      const isConfirmed = confirm("수정 하시겠습니까?");
      showEditButton(event);
      if (isConfirmed) {
        currentInput.readOnly = false;
        currentInput.focus();
      }
    }

    function validate(event) {
    	  const value = event.target.value.trim();
    	  const inputId = event.target.getAttribute("name");
    	  const isValid = validateInput(inputId, value);

    	  if (!isValid) {
    	    resetOriginalValue(inputId); // 유효성 검사 실패 시 원래 값으로 돌려놓음
    	  }
    	}

    function showEditButton(event) {
      const editButton = document.querySelector(".editButton");
      editButton.style.display = "block";
    }

    function validateInput(inputId, value) {
      if (inputId === "teamName") {
        const teamNames = ["인사팀", "호텔경영팀", "프론트팀", "식음팀", "구매팀"];
        if (!teamNames.includes(value)) {
          alert("인사팀, 호텔경영팀, 프론트팀, 식음팀, 구매팀 중 1개의 팀명을 입력하세요.");
          return false;
        }
      } else if (inputId === "positionName") {
        const positionNames = ["사원", "슈퍼바이저", "팀장", "매니저"];
        if (!positionNames.includes(value)) {
          alert("사원, 슈퍼바이저, 팀장, 매니저 중 1개의 직책명을 입력하세요.");
          return false;
        }
      } else if (inputId === "email") {
        const emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        if (!emailPattern.test(value)) {
          alert("올바른 이메일 형식이 아닙니다. 영어로만 입력하세요.");
          return false;
        }
      } else if (inputId === "salary") {
        const salaryPattern = /^\d*$/;
        if (!salaryPattern.test(value)) {
          alert("연봉은 숫자만 입력 가능합니다.");
          return false;
        }
      } else if (inputId === "id") {
        const idPattern = /^\d{0,11}$/;
        if (!idPattern.test(value)) {
          alert("휴대폰번호는 숫자만 입력 가능하며 최대 11글자를 초과할 수 없습니다.");
          return false;
        }
      }

      return true;
    }

    allInputs.forEach((input) => {
    	const inputId = input.getAttribute("name");
    	  originalValues[inputId] = input.value;
      input.addEventListener("click", handleInputClick);
      input.addEventListener("change", validate);
    });
  
    teamNameInput.addEventListener("click", handleInputClick);
    teamNameInput.addEventListener("change", validate);

    positionNameInput.addEventListener("click", handleInputClick);
    positionNameInput.addEventListener("change", validate);

    emailInput.addEventListener("click", handleInputClick);
    emailInput.addEventListener("change", validate);

    salaryInput.addEventListener("click", handleInputClick);
    salaryInput.addEventListener("change", validate);

    phoneInput.addEventListener("click", handleInputClick);
    phoneInput.addEventListener("change", validate);
    
	 document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
	
	 
	 function getCommuteRecord() {
		 const userNo = document.querySelector(".userNo").innerText;
			$.ajax({
				url: "${root}/hr/em/commute",
			    method: "POST",
			    data: {
			    	userNo: userNo,
		        },
			    dataType: "json",
			    success: function (x) {
			        console.log(x);
			
			        const otbody = document.querySelector(".aj");
			        let ostr = "";

			        for (let i = 0; i < x.length; i++) {
			        	ostr += '<div class="memberVoList" onclick="goDetail('+x[i].no +')">'+
		                ' <div class="bbr" style="padding-left: 10px;">'+ x[i].teamName + '</div>'+
		                ' <div class="bbr" style="padding-left: 20px;">'+ x[i].positionName + '</div>' +
		                ' <div class="bbr">'+ x[i].name + '</div>' +
		                ' <div class="bbr" style="padding-left: 30px;">0'+x[i].id + '</div>' +
		                ' <div class="bbr">'+x[i].email + '</div>' +
		                ' <div>'+x[i].enrollDate + '</div>'
		                +'</div>'
		                ;
					   
			        }
						ostr +='</div>';
			
			        otbody.innerHTML = ostr;
			    },
			    error: function (e) {
			        console.log(e);
			    },
			});
			
		}
		

	 

	 
	 
	 
	 
    	
   
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

