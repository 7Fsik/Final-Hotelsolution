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
</head>
<style>
	.chatWrap{
	    background-color: white;
	    margin: auto;
	    width: 350px;
	    height : 500px;
	  border-radius: 10px;
	  
	}
	.container {
	    font-size: 20px;
	    margin: auto;
	  display: grid;
	  grid-template-columns: 9fr 1fr ;
	  background-color: white;
	  gap: 10px;
	  width: 350px;
	  height: 40px;
	  
	}
	
	.item {
	    text-align: center;
	  
	    padding: 10px;
	}
	.receive-chat-area{
	    
	  	overflow-y: scroll;
	    gap: 10px;
	    height : 450px;
	     display: flex;
	   flex-direction: column; /* 아이템들을 세로로 배치 */
	   
	}
	
	
	.receive-chat-area > div {
	  padding: 10px; /* 원하는 간격 설정 */
	  border-bottom: 1px solid lightgray; /* 아래에 경계선 추가 */
	}
	 
	.chat-area {
	display: grid;
	grid-template-columns: 1fr 4fr;
	
	}

	/* 스크롤바 스타일 설정 */
	::-webkit-scrollbar {
		width: 10px;
		background-color: #3B444B; /* 연한 하늘색 배경색 */
	}

	::-webkit-scrollbar-thumb {
		background-color: #3B444B; /* 연한 하늘색 스크롤바 색상 */
		border-radius: 5px; /* 스크롤바를 둥글게 보이도록 설정 */
	}

	::-webkit-scrollbar-thumb:hover {
		background-color: #1976D2; /* 마우스 오버 시 스크롤바 색상 변경 */
	}

	.write-area-btn{
		display : grid;
		grid-template-columns: 5fr 1fr;
		wirdth : 350px;
		height : 55px;
	}

	.content{
		overflow: visible;
		resize: none;
	}
	#chat{
		height : 50px;
	}
	.submit-out-btn{
		display : grid;
		grid-template-columns: 1fr 1fr;
	}
	#out{
		display:none;
	}

	.item{
		height : 30px;
	}
	#toggleButton{
		border : 0px;
		height :40px;
		background-color:white;
	}
	
	#wc {
		border-radius: 10px;
		background-color: white;
		color: #94d2e6;
		border: 3px solid lightgray;
		font-weight: bold;
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
	<div class="chatWrap">
			<div class="receive-chat-area">
				<c:forEach items="${tvoList}" var="vo">
			    	<div>
				    	<strong>[${vo.senderName}]</strong>
				    	<span>${vo.content}</span>
				    	<sub>${vo.enrollDate}</sub>
			    	</div>
				</c:forEach>
			</div>
           
           
		<div class= "write-area-btn" id="ta">
		
				<form id="chatForm" method="post">
				    <textarea name="chat" id="chatInput" style="resize: none;" placeholder="채팅칸."></textarea>
				    <input id="wc" type="button" value="채팅작성" onclick="f01(${loginMember.teamNo})">
				</form>

		</div>
		
		<br>
		<br>
           
           
       
    </div>


	
	
	
	
	
	<script>
		const resultDiv = document.querySelector(".receive-chat-area");
		 resultDiv.scrollTop = resultDiv.scrollHeight;
		//웹소켓 만들기
		let ws = new WebSocket("ws://127.0.0.1:8080/fire/hsSock");
		
		ws.onopen = funcOpen;
		ws.onclose = funcClose;
		ws.onerror = funcError;
		ws.onmessage = funcMessage;
	
		function funcOpen() {
			console.log("소켓연결됨 ~ !");
			resultDiv.innerHTML += '<div style="text-align:center;"> 환영합니다</div>'
		}
		function funcClose() {
			console.log("소켓닫힘 ~ !");
		}
		function funcError() {
			console.log("소켓 에러남 ~ !");
		}
		
		function funcMessage(event) {
			console.log("소켓 통해서 메세지 받음 ~ !");
			const obj = JSON.parse(event.data);
			console.log(obj);
			resultDiv.innerHTML += '<div>' 
								+ "<strong>[" + obj.senderName + "]</strong>" 
								+ "<span> " + obj.content + " </span>" 
								+ "<sub>" + obj.sendTime + "</sub>" 
								+ '</div>';
			$.ajax({
		        type: "POST",
		        url: "${root}/chat/troom",
		        data: JSON.stringify({
		            content: obj.content,
		            senderNo: obj.senderNo
		        }),
		        contentType: "application/json",
		        success: function (response) {
		        	 resultDiv.scrollTop = resultDiv.scrollHeight;
		            // 성공적으로 데이터를 전송한 후의 동작을 여기에 추가
		        },
		        error: function (xhr, status, error) {
		            console.error("Error:", error);
		        }
		    });
			
		}
		
		
		
		function f01(no){
			console.log("room tyno"+no);
			const userMsg = no + document.querySelector("#chatInput").value;
			ws.send(userMsg);
			document.querySelector("#chatInput").value="";
			
			 // jQuery를 이용한 Ajax POST 요청
	        
			
			
		}
		
		
	</script>




</body>
</html>