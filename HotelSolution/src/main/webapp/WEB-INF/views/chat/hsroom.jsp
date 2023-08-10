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
	    width: 500px;
	    height : 500px;
	  border-radius: 10px;
	  
	}
	
	
		.receive-chat-area{
	    
	  	overflow-y: auto;
	    gap: 10px;
	    width:500px;
	    height : 580px;
	     display: flex;
	   flex-direction: column; /* 아이템들을 세로로 배치 */
	   
	}
	
	
	.write-area-btn{
		
		width : 500px;
		height : 55px;
	}
	.receive-chat-area > div {
	 word-wrap: break-word;
    overflow-wrap: break-word; 
	width : 480px;
	  padding: 10px; 
	}
	
	#chatForm{
		display : grid;
		grid-template-columns: 5fr 1fr;
	}
	.item {
	    text-align: center;
	  
	    padding: 10px;
	}
	
	
	 
	.chat-area {
	display: grid;
	grid-template-columns: 1fr 4fr;
	
	}

	/* /* 스크롤바 스타일 설정 */
	::-webkit-scrollbar {
		width: 10px;
		background-color: white; /* 연한 하늘색 배경색 */
	}

	::-webkit-scrollbar-thumb {
		background-color: white; /* 연한 하늘색 스크롤바 색상 */
		border-radius: 5px; /* 스크롤바를 둥글게 보이도록 설정 */
	}

	::-webkit-scrollbar-thumb:hover {
		background-color: #3B444B; /* 마우스 오버 시 스크롤바 색상 변경 */
	} */


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
	.chatmessage{
	
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
    .tnone{
   	text-decoration: none;
   }
</style>
<body>
 		  <img class="header-logoimg" src="${root}/resources/img/호텔솔루션.png" alt="로고이미지" style="width: 500px;"> 
        <div id="topnothing">
           
                    
	            
	        <div id="search">
	        	<div class="search-area">
	           		<a class="tnone" href = "${root}/chat/rooms?no=${loginMember.no}">개인채팅방</a>
	            </div>
	            <div  class="search-area">
					<a class="tnone" href="${root}/chat/troom">${loginMember.teamName}채팅방</a>
				</div>
	        	<div  class="search-area">
	        		<a class="tnone" href="${root}/chat/hsroom">공용 채팅방</a>
	        	</div>
	           <input type="hidden" class="memberName" value="${loginMember.name }">
	        </div>
        </div>
         <hr style="background-color: rgb(214, 248, 246);">
	<div class="chatWrap">
			<div class="receive-chat-area">
				<c:forEach items="${voList}" var="vo">
			    	<c:if test="${vo.senderNo == loginMember.no}">
			    	<div class="chatmessage" style="padding-left: 230px;">
			    		<div style="width: 250px;">
			    			<div style="width: 240px; border: 1px solid #3B444B; padding-left: 10px; padding-right: 10px; padding-top: 10px; border-radius:  20px; ">
						    	 ${vo.content}</br>
						    	 <p style="font-size: 10px; ">${vo.enrollDate}</p>
			    			</div>
					    	  
				    	</div>
				    	
			    	</div>
			    </c:if>	
			  	<c:if test="${vo.senderNo != loginMember.no}">
			       <div class="chatmessage" style="padding-right: 230px;">
			       		<div style="width: 250px;">
			       			<strong>[${ vo.senderTeamName}][${vo.senderPositionName }][${vo.senderName}]</strong> </br> 
				    		<div style="background-color: rgba(59, 68, 75, 0.2); margin-top : 10px; width: 240px; border: 1px solid #3B444B; padding-left: 10px; padding-right: 10px; padding-top: 10px; border-radius:  20px; ">
					    		
						    	${vo.content}</br>
						    	 <p style="font-size: 10px; ">${vo.enrollDate}</p>
						    	 </div>
					    	</div>
			    		</div>
			    	</c:if>
				</c:forEach>
			</div>
           
           
		<div class= "write-area-btn" id="ta">
		
				<form id="chatForm" method="post">
				    <textarea name="chat" id="chatInput" style="resize: none;" placeholder="채팅칸."></textarea>
				    <input id="wc" type="button" value="채팅작성" onclick="f01(${loginMember.no})">
				</form>

		</div>
		 <input type="hidden" class="loginMemberNo" value="${loginMember.no}">
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
			const membernameDiv = document.querySelector(".membername");
			const memberName = membernameDiv.value;
			console.log("소켓연결됨 ~ !");
			resultDiv.innerHTML += '<div style="text-align:center;">'+ memberName+'님 환영합니다</div>'
			resultDiv.scrollTop = resultDiv.scrollHeight;
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
			const loginMemberNo = document.querySelector(".loginMemberNo").value;
			if(obj.teamChatNo=='0'){
				if(obj.senderNo==loginMemberNo){
					resultDiv.innerHTML += '<div class="chatmessage" style="padding-left: 230px;"><div style="width: 250px;"><div style="width: 240px; border: 1px solid #3B444B; padding-left: 10px; padding-right: 10px; padding-top: 10px; border-radius:  20px; ">'+
					obj.content+
					'</br><p style="font-size: 10px;">' +  obj.sendTime+
			    	'</p></div></div></div>';
			    	  					
				}else{
					resultDiv.innerHTML += '	<div class="chatmessage" style="padding-right: 230px;">' 
						+ "<div style=width: 250px;><strong>[" + obj.senderTeamName + "]" +"[" + obj.senderPositionName + "]" +"[" + obj.senderName + ']</strong></br><div style=" background-color: rgba(59, 68, 75, 0.2); margin-top : 10px; width: 240px; border: 1px solid #3B444B; padding-left: 10px; padding-right: 10px; padding-top: 10px; border-radius:  20px; ">' 
						+ obj.content 
						+ '</br><p style="font-size: 10px;">' + obj.sendTime + "</p>" 
						+ '</div></div></div>';
						
						
					
				}
			}
		   resultDiv.scrollTop = resultDiv.scrollHeight;
						            // 성공적으로 데이터를 전송한 후의 동작을 여기에 추가
		}
		
			
		
		
		function f01(no){
			const content = document.querySelector("#chatInput").value;
			const dataToSend = {
					content: content,
			        teamChatNo: "0",
			    };
			ws.send(JSON.stringify(dataToSend));
			document.querySelector("#chatInput").value="";
			$.ajax({
		        type: "POST",
		        url: "${root}/chat/hsroom",
		        data: JSON.stringify({
		            content: content,
		            senderNo: no
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
			 // jQuery를 이용한 Ajax POST 요청
	        
			
			
		}
		
		
		
		
	</script>




</body>
</html>