<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        margin: 0px;
    }

    #wrap{
    	width:100vw;
    	height:100vh;
    	display:flex;
    	justify-content:center;
    	align-items:center;
    }
    
    #box{
        width: 1000px;
        height: 800px;
        border: 1px solid #3B444B;
        border-radius: 10px;
        margin: 0 auto;
    }
    
    #logo{
        display: flex;
        justify-content: center;
        margin-top : 30px;
    }
    
    #search-area{
    	display:flex;
    	flex-direction: column;
    	width:270px;
    }

	#search-area > div:first-child{
		font-size:20px;
		font-weight:bold;
		margin-top:10px;
		color: #86C8DB;
	}
	
	#search-bar{
		margin-top:15px;
	}
	
	#search-bar > input{
		width:150px;
	}
	
	#search-bar > button{
		width:50px;
		height:21.5px;
		background-color:white;
		border:1px solid black;
		box-sizing:border-box;
	}
	
	#employee{
		height:550px;
		border:1px solid lightgray;
	}
	
	.team{
		height:30px;
		background-color:#e9ecef;
		border:1px solid #e9ecef;
		box-sizing:border-box;
		display:flex;
		align-items:center;
	}
	
	.teamName{
		padding:7px 0px;
		margin-left :7px;
		font-size:14px;
	}
	
	.position{
		font-size:13px;
		font-weight:bold;
	}

	.iii{
		font-size: 13px;
	}

	#iconHr.opened::before {
    	transform: rotate(45deg); 
	}
	
	#iconFinance.opened::before {
    	transform: rotate(45deg); 
	}
	
	#iconMange.opened::before {
    	transform: rotate(45deg); 
	}
	
	#iconFront.opened::before {
    	transform: rotate(45deg); 
	}
	
	#iconFood.opened::before {
    	transform: rotate(45deg); 
	}
	
   
	
	
    
</style>
</head>
<body>

	<div id="wrap">

    <form action="">
        <div id="box">
            <div id="logo">
                <img style="width: 300px;" src="${root}/resources/img/호텔솔루션.png" alt="">
            </div>
            
            <div id="search-area">
            	<div class="lineText">결재선 설정</div>
            	<div id="search-bar">
	            	<input type="text" name="search" placeholder="이름 검색">
	            	<button>검색</button>
	            	<div id="employee">
	            		<div class="team-container">
			            	<div class="team">조직도</div>
							${members}
							<div onclick="openHr();" class="teamName"><i id="iconHr" class="bi bi-plus-circle-fill iii"></i>인사팀</div>
							<div id="hrTeam" style="display:none">
								<div class="position">
									<div>사원</div>
									<div>슈퍼바이저</div>
									<div>팀장</div>
								</div>
							</div>
							
							<div onclick="openFinance();" class="teamName"><i id="iconFinance" class="bi bi-plus-circle-fill iii"></i>구매/재무팀</div>
							<div id="financeTeam" style="display:none">
								<div class="position">
									<div>사원</div>
									<div>슈퍼바이저</div>
									<div>팀장</div>
								</div>
							</div>
							
							<div onclick="openManage();" class="teamName"><i id="iconMange" class="bi bi-plus-circle-fill iii"></i>경영지원팀</div>
							<div id="manageTeam" style="display:none">
								<div class="position">
									<div>사원</div>
									<div>슈퍼바이저</div>
									<div>팀장</div>
								</div>
							</div>
							
							<div onclick="openFront();" class="teamName"><i id="iconFront" class="bi bi-plus-circle-fill iii"></i>프론트/시설관리팀</div>
							<div id="frontTeam" style="display:none">
								<div class="position">
									<div>사원</div>
									<div>슈퍼바이저</div>
									<div>팀장</div>
								</div>
							</div>
							
							<div onclick="openFood();" class="teamName"><i id="iconFood" class="bi bi-plus-circle-fill iii"></i>식음팀</div>
							<div id="foodTeam" style="display:none">
								<div class="position">
									<div>사원</div>
									<div>슈퍼바이저</div>
									<div>팀장</div>
								</div>
							</div>
	            		</div>
	            	</div>
            	</div>
            </div>
            
            <div id="main-area">
            
				            
            </div>
                   

        </div>

     </form>

    </div>

    <script>

		

		function openHr(params) {
			const hrTeam = document.getElementById('hrTeam');
			const iconHr = document.querySelector('#iconHr');
			console.log(iconHr);
			if(hrTeam.style.display == 'none' || hrTeam.style.display == ''){
				hrTeam.style.display = 'inline';
				iconHr.classList.add('opened');
			}else{
				hrTeam.style.display = 'none';
				iconHr.classList.remove('opened');
			}
			
		}

		function openFinance(params) {
			const financeTeam = document.getElementById('financeTeam');
			const iconFinance = document.querySelector('#iconFinance');
			if(financeTeam.style.display == 'none' || financeTeam.style.display == ''){
				financeTeam.style.display = 'inline';
				iconFinance.classList.add('opened');
			}else{
				financeTeam.style.display = 'none';
				iconFinance.classList.remove('opened');
			}
			
		}
		
		function openManage(params) {
			const manageTeam = document.getElementById('manageTeam');
			const iconMange = document.querySelector('#iconMange');
			if(manageTeam.style.display == 'none' || manageTeam.style.display == ''){
				manageTeam.style.display = 'inline';
				iconMange.classList.add('opened');
			}else{
				manageTeam.style.display = 'none';
				iconMange.classList.remove('opened');
			}
			
		}

		function openFront(params) {
			const frontTeam = document.getElementById('frontTeam');
			const iconFront = document.querySelector('#iconFront');
			if(frontTeam.style.display == 'none' || frontTeam.style.display == ''){
				frontTeam.style.display = 'inline';
				iconFront.classList.add('opened');
			}else{
				frontTeam.style.display = 'none';
				iconFront.classList.remove('opened');
			}
			
		}

		function openFood(params) {
			const foodTeam = document.getElementById('foodTeam');
			const iconFood = document.querySelector('#iconFood');
			if(foodTeam.style.display == 'none' || foodTeam.style.display == ''){
				foodTeam.style.display = 'inline';
				iconFood.classList.add('opened');
			}else{
				foodTeam.style.display = 'none';
				iconFood.classList.remove('opened');
			}
			
		}


    </script>

</body>
</html>