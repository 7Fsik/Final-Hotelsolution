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
        height: 80px;
        padding-top: 30px;
        background-color: #3B444B;
        
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
   
</style>
<body>
        <div id="topnothing">
          
            
        <div id="search">
        	<div  class="search-area">
        		<a href="${root}/chat/hsroom">공용 채팅방</a>
        	</div>
			<div  class="search-area">
				<a href="${root}/chat/troom">${loginMember.teamName}채팅방</a>
			</div>
			<div class="search-area">
           		${loginMember.name}채팅방
            </div>
           
        </div>
        </div>
        <hr style="background-color: rgb(214, 248, 246);">
	<div class="chatlistWrap">

    	<div >
          
     
               
			<div>
		    <button id="openModalBtn">생성</button>
			</div>
			
			<!-- 모달 엘리먼트 -->
			<!-- 모달 엘리먼트 -->
			<div id="myModal" class="modal">
			    <div class="modal-content">
			        <span class="close">&times;</span>
			        <div id="teamContainer" style="display: grid; grid-template-columns:1fr 1fr; grid-gap:10px;">
			            <c:forEach items="${tvo}" var="vo">
			                <div class="team" onclick="goPosition()">${vo.teamName}</div>
							<div id="positionContainer" class="positionContainer">
								
							</div>

			            </c:forEach>
			            <div id="detailsContainer"></div>
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
});

// 모달 외부 클릭 시 닫기
window.addEventListener('click', function(event) {
    if (event.target === modal) {
        modal.style.display = 'none';
    }
});

let detailsVisible = false;

function goPosition(clickedDiv) {
    const detailsContainer = document.querySelector('.details-container');
    const positionContainer = document.querySelector('.positionContainer');
    
    // 이미 존재하는 상세 정보 삭제
    positionContainer.innerHTML = '';

    if (!detailsVisible) {
        const pvoList = ${pvo}; // pvo는 JSTL로 받아온 데이터

        if (pvoList && pvoList.length > 0) {
            pvoList.forEach(pvoItem => {
                const pvoInnerDiv = document.createElement('div');
                pvoInnerDiv.textContent = pvoItem.name;
                positionContainer.appendChild(pvoInnerDiv);
            });

            detailsVisible = true;
        }
    } else {
        detailsVisible = false;
    }
}

	
</script>
	
</body>
</html>