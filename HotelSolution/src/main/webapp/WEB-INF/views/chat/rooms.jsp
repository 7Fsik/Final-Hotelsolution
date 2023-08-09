<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 폰트어썸 cdn -->
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
    <c:set var="root" value = "${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


</head>
<style>
    
    .chatlist{
        display: grid;
        grid-template-rows: 1fr 1fr;
        grid-template-columns: 1fr 6fr;
        
        height: 60px;
        
        padding-top: 20px;
    }
   
    .chatlistImg{
        width : 80px;
        height : 80px;
        border-radius: 70px;
        cursor: pointer;
    }
    .chatlistWrap{
        width: 500px;
        margin: auto;
        height: 600px;
        overflow: visible;
       
    }

 
    #page-area{
         width : 500px;
         margin: auto;
         display: flex;
         justify-content: space-evenly; 
   }
    #searchValue{
       background-color: white;
       border : 0.2px solid rgb(214, 248, 246);
       padding-left: 5px;
       border-radius: 10px;
   }

   .openOldChatByRoomNo{
   
   	width : 65px;
   	height : 25px;
   	border : 0px;
   	border-radius : 30px;
   	 background-color: #94d2e6;
   	 color: white;
   }
   

   .list-wrap{
   		display : grid;
   		grid-template-columns: 1fr 5fr;
   		height : 100px;
   }
   .list-text{
        display: grid;
        grid-template-rows: 3fr 1fr;
        font-size : 16px;
        height : 100px;
   }
    .list-text2{
        display: grid;
        height: 25px;
        grid-template-columns: 3fr 1fr;
        font-size : 12px;
   }
   .imgdiv{
   		display :grid;
   		grid-template-rows: 4fr 1fr;
   		width:80px;
   		height:100px;
   }
   #topnothing{
        padding-top: 20px;
        
    }
       #search{
       display: grid;
	grid-template-columns: 1fr 1fr 1fr;       
      
   }
   
   .search-area{
   text-align: center;
   }
   /* 모달 스타일링 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    height : 600px;
    border-radius: 5px;
}

.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    text-align: right;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
   
   .team{
   		cursor: pointer;
   }
   .teamhover:hover{
   	background-color: lightgray;
   }
   .teamContainer:hover{
   	background-color: lightgray;
   }
   #teamWrap{
   		display: grid;
   		grid-template-columns: 2fr 1fr;
   }
   .list:hover{
   		background-color: lightgray;
   		cursor: pointer;
   }
    .scrollable-container {
    height:600px;
        max-height: 600px; /* 원하는 높이로 조정하세요 */
        overflow-y: auto;
        border: 1px solid #ccc; /* 스크롤 가능한 컨테이너를 감싸는 테두리를 추가합니다 */
    }
    .uimage{
    	text-align: center;
    	align-content: center;
    	align-items: center;
    }
    .uImage > img{
    	width: 72px;
    	height: 72px;
    	border-radius: 10px;
    	
    }
    .currentMsg{
  	text-align: right; 
  	padding-right:10px; 
  	color: red; 
    }
    .chatRoomList{
    	cursor: pointer;
    }
</style>
<body>
              <img class="header-logoimg" src="${root}/resources/img/호텔솔루션.png" alt="로고이미지" style="width: 500px;"> 
        <div id="topnothing">
           <input type="hidden" id="loginMemberNo" value="${loginMember.no}">
                    
	            
	        <div id="search">
	        	<div class="search-area">
	           		<a href = "${root}/chat/rooms?no=${loginMember.no}">개인채팅방</a>
	            </div>
	            <div  class="search-area">
					<a href="${root}/chat/troom">${loginMember.teamName}채팅방</a>
				</div>
	        	<div  class="search-area">
	        		<a href="${root}/chat/hsroom">공용 채팅방</a>
	        	</div>
				
				
	           
	        </div>
        </div>
        <hr style="background-color: rgb(214, 248, 246);">
	<div class="chatlistWrap">

	    <div class="scrollable-container">
		    <c:forEach items="${voList}" var="vo">
		    	<c:if test="${vo.user1No eq (loginMember.no)}">
		  
			       <div class="chatRoomList" style="display: grid; grid-template-columns: 1fr 5fr; height: 72px;" onclick="goChatRoom(${vo.user1No},${vo.user2No},${vo.no})"> <!-- 수정된 부분 -->
					    <div class="uImage"><img alt="" src="${root}/resources/img/member/profile/${vo.user2Image}"></div>
					    <div style="display: grid; grid-template-rows: 1fr 1fr;"> <!-- 수정된 부분 -->
					        <div style="padding-left: 20px;">${vo.user2Name} ${vo.user2PositionName} (${vo.user2TeamName})</div>
					        <div class="currentMsg" ></div>
					        <input type="hidden" class="teamChatNo" value="${vo.no}">
					       
					    </div>
					</div>
					<br>
				</c:if>
				<c:if test="${vo.user2No eq (loginMember.no)}">
				
			     <div class="chatRoomList" style="display: grid; grid-template-columns: 1fr 5fr; height: 72px;"onclick="goChatRoom(${vo.user1No},${vo.user2No},${vo.no})">
					    <div class="uImage">  	<img alt="" src="${root}/resources/img/member/profile/${vo.user1Image}"></div>
					    <div style="display: grid; grid-template-rows: 1fr 1fr;"> <!-- 수정된 부분 -->
					        <div  style="padding-left: 20px;">${vo.user1Name} ${vo.user1PositionName} (${vo.user1TeamName})</div>
					        <div class="currentMsg" > </div>
						    <input type="hidden" class="teamChatNo" value="${vo.no}">
					    </div>
					</div>
					<br>
				</c:if>

		    </c:forEach>
		</div>
	</div>
		    <button id="openModalBtn">생성</button>
			
				<!-- 모달 엘리먼트 -->
				<!-- 모달 엘리먼트 -->
				<div id="myModal" class="modal">
				    <div class="modal-content">
				    <div id="searchArea">
		                    <select id="searchType">
		                        <option value="name">이름</option>
		                        <option value="positionName">직책</option>
		                        <option value="teamName">부서</option>
		                    </select>
		                    <input type="text" id="searchValue" placeholder="검색할 값을 입력하세요">
		                    <button id="searchButton" onclick="performSearch()">검색</button>
               		 </div>
				        <span class="close">&times;</span>
				        <div id="teamWrap" style="height:500px;">
			            	<div>
					            <c:forEach items="${tvo}" var="tvo">
					                <div class="team" onclick="goPosition(this)" style="height: 100px; display:grid; grid-template-columns:1fr 1fr"><span style="height: 22px"  class="teamhover">${tvo.teamName}</span>
					                	<div id="positionContainer" class="positionContainer"  style="display: none;">
										  <c:forEach items="${pvo}" var="pvo">
										  		<div class="teamContainer" onclick="searchMember(${tvo.teamNo},${pvo.no})">
										  			${pvo.name}	
										  		</div>
										  </c:forEach>
									</div>
					                	
					                </div>
									
					            </c:forEach>
				            </div>
				            <div id="detailsContainer">
				            </div>
				        </div>
				    </div>
				</div>

       
  
        
      
        
    </div>
   </div>
  
<script>
const openModalBtn = document.getElementById('openModalBtn');
const modal = document.getElementById('myModal');
const modalContent = modal.querySelector('.modal-content');
const closeBtn = modal.querySelector('.close');

// 모달 열기 버튼 클릭 시
openModalBtn.addEventListener('click', function() {
    modal.style.display = 'block';
});

// 모달 닫기 버튼 클릭 시
closeBtn.addEventListener('click', function() {
    modal.style.display = 'none';
    let detailsContainer = document.querySelector('#detailsContainer');
    detailsContainer.innerHTML = ""; // 수정된 부분
});

// 모달 외부 클릭 시 닫기
window.addEventListener('click', function(event) {
    if (event.target === modal) {
    	let detailsContainer = document.querySelector('#detailsContainer');
        detailsContainer.innerHTML = ""; // 수정된 부분
        modal.style.display = 'none';
    }
});

let detailsVisible = false;

function goPosition(clickedTeam) {
    const positionContainer = clickedTeam.querySelector('.positionContainer');
    const firstTeamContainer = positionContainer.children[0]; // 첫 번째 자식 요소 선택
    
    if (positionContainer.style.display === 'none') {
        positionContainer.style.display = 'block';
    } else {
        positionContainer.style.display = 'none';
    }
    
    // firstTeamContainer를 여기서 사용할 수 있습니다.
}
function performSearch() {
	
    const searchType = document.querySelector("#searchType").value; // 검색 조건 가져오기
    const searchValue = document.querySelector("#searchValue").value; // 검색 값을 가져오기

    $.ajax({
        url: "${root}/chat/searchMember",
        method: 'POST',
        data: {
            searchType: searchType,
            searchValue: searchValue // 변수명 수정
        },
        dataType: 'json', 
        success: function(data) {
            let str = "";
            const length = data.length;
            const div = document.querySelector("#detailsContainer");
            div.innerHTML = ""; // #detailsContainer 내용 비우기
            let loginMemberNo = document.querySelector("#loginMemberNo").value;
            for (let i = 0; i < length; i++) {
                div.innerHTML += '<div class="list" onclick="createChat(' + data[i].no + ',' + loginMemberNo + ')">' + '('+data[i].teamName+')'+ data[i].name + '</div>';
            }
        },
        error: function(error) {
            // AJAX 요청이 실패했을 때 처리
        }
    });
}

function searchMember(teamNo, positionNo) {
    $.ajax({
        url: "${root}/chat/searchMember",
        method: 'POST',
        data: {
            teamNo: teamNo,
            positionNo: positionNo
        },
        dataType: 'json', 
        success: function(data) {
            let str = "";
            const length = data.length;
            const div = document.querySelector("#detailsContainer");
            div.innerHTML = ""; // #detailsContainer 내용 비우기
            let loginMemberNo = document.querySelector("#loginMemberNo").value;
            for (let i = 0; i < length; i++) {
            	
            	div.innerHTML += '<div class="list" onclick="createChat(' + data[i].no + ',' + loginMemberNo + ')">' + '('+data[i].teamName+')'+ data[i].name + '</div>';
            }
            
          
        },
        error: function(error) {
            // AJAX 요청이 실패했을 때 처리
        }
    });
}

function createChat(no,loginMemberNo) {
	  if (no === loginMemberNo) {
	        alert("본인과의 채팅은 불가능 합니다."); // 메시지 표시
	        return; // 실행 중단
	    }

    $.ajax({
        url: "${root}/chat/room",
        method: 'POST',
        data: {
            selectMemberNo: no,
        },
        success: function(data) {
        	let x = JSON.parse(data);
        	
        	goChatRoom(x.user1No,x.user2No,x.no);
            
        },
        error: function(error) {
            // AJAX 요청이 실패했을 때 처리
        }
    });
}

function goChatRoom(user1No,user2No,chatRoomNo){
	window.location.href = "${root}/chat/room?selectMemberNo=" + user2No+"&user1No="+user1No+"&chatRoomNo="+chatRoomNo;
}

noneCheckCnt;
function noneCheckCnt() {
 

    // AJAX 요청을 보냅니다.
	// class명이 currentMsg인 요소들을 가져옵니다.
	const currentMsgElements = document.querySelectorAll('.currentMsg');

	$.ajax({
	    url: "${root}/chat/checkCnt", // 실제 서버의 URL 주소로 대체해야 합니다.
	    method: 'POST', // 또는 GET 등 HTTP 메서드를 선택합니다.
	    dataType: 'json',
	    success: function(response) {
	        console.log("서버 응답:", response);
	        // response는 배열 형태의 데이터일 것이므로, 배열의 각 요소를 순회합니다.
	        for (let i = 0; i < response.length; i++) {
	            // 현재 반복하는 요소의 innerText 값을 가져옵니다.
	            if(response[i]!=0){
	            	
	            currentMsgElements[i].innerText = response[i];
	            }
	            
	            // 가져온 innerText와 response 값을 조합하여 작업을 수행합니다.
	        }
	    },
	    error: function(error) {
	        // AJAX 요청이 실패했을 때 처리하는 로직
	        console.error("에러:", error);
	    }
	});


}

	
	//함수 호출로 "teamChatNo" 값을 서버로 전송합니다.
	noneCheckCnt();
</script>
	
</body>
</html>