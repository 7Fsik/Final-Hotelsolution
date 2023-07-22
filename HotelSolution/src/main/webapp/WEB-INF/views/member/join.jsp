<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        margin: 0px;
    }
    
    a{
        text-decoration:none;
        color: black;
        transition-duration: 1s;
    }
    
    a:hover{
    	color : #586b79;
    }

    #wrap{
    	width:100vw;
    	height:100vh;
    	display:flex;
    	justify-content:center;
    	align-items:center;
    }
    
    #box{
        width: 700px;
        height: 510px;
        border: 1px solid #3B444B;
        border-radius: 10px;
        margin: 0 auto;
    }
    
    #logo{
        display: flex;
        justify-content: center;
        margin-top : 20px;
    }

    .join-area{
         display: grid;
        grid-template-columns: repeat(2,1fr);
        grid-template-rows: 1fr 0.5fr;
        font-size:20px;
        place-items: center;
        margin-top:15px;
    }
    
    label {
    	display:inline-block;
    	width:100px;
    }
	
	.join-area > input{
		border: none;
        outline: none;
        font-size:17px;
        padding: 3px;
        width: 200px;
	}

    /* @media(max-width: 768px){
        .login-area{
            flex-direction: column-reverse;
        }
    } */
    

    #join-btn{
    	margin: auto;
    	display : flex;
    	justify-content:center;
    	margin-top:5px;
    }
    
   
    #join-btn > input{
    	width:200px;
    	height:30px;
    	font-size:20px;
    	color:white;
    	background-color:black;
    	border : 1px solid black;
    	border-radius: 5px;
    	margin-top : 5px;
    	font-weight:700;
    	transition-duration: 0.5s;
    } 
    
     #join-btn > input:hover{
        cursor: pointer;
       background-color:#586b79;

    }
    
    #imgFile{
    	display: none;
    }
    
    .profile{
    	color:gray;
    }
    
    .profile:hover{
        cursor: pointer;
        color : #586b79;
    }
    
    select{
    	border :1px solid lightgray;
    	border-radius:10px;
    	width:100px;
    }
    
    input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	   	 -webkit-appearance: none;
	   	 margin: 0;
	}
	
	.errorMessage{
		font-size:15px;
		position:relative;
		left:315px;
	}
    
	
</style>
</head>
<body>

	<div id="wrap">

    <form action="${root}/member/join" method="post" enctype="multipart/form-data">
        <div id="box">
            <div id="logo">
                <img style="width: 300px;" src="${root}/resources/img/호텔솔루션.png" alt="">
            </div>
            
            <div class="join-area">
                <label for="">NAME</label>
                <input name="name" type="text" placeholder="이름을 입력하세요." >
            </div>
            
            <div class="join-area">
                 <label for="">ID</label> 
                <input name="id" type="text" placeholder="휴대폰번호로 가입하기" maxlength="11" oninput="checkId(this); checkEmpty(this);" onblur="checkEmpty(this);">
                <span class="errorMessage" style="display: none; color: red;">* 아이디를 입력하세요.</span>
            </div>
           
            <div class="join-area">
                 <label for="">PWD</label> 
                <input name="password" type="password" placeholder="8~16자 대문자+특수문자" maxlength="16" oninput="checkPwd(this);" onblur="checkEmpty(this);">
                <span class="errorMessage" style="display: none; color: red;">* 비밀번호를 입력하세요.</span>
            </div>
           
            <div class="join-area">
                 <label for="">E-MAIL</label> 
                <input name="email" type="email" placeholder="이메일을 입력하세요">
            </div>
           

                <div class="join-area">
                    <label for="">PROFILE</label> 
                    <label class="profile" for="imgFile">
                       프로필사진
                    </label>
                   <input name="image" type="file" id="imgFile">
               </div>
   
               <div class="join-area">
                    <label for="">POSITION</label> 
                    <select name="positionNo" class="select">
                       <option disabled selected value="">직급</option>
                       <option value="1">사원</option>
                       <option value="2">슈퍼바이저</option>
                       <option value="3">팀장</option>
                       <option value="4">호텔지배인</option>
                    </select>
                   
               </div>
               
               <div class="join-area">
                    <label for="">DEPARTMENT</label> 
                    <select name="teamNo" class="select">
                       <option disabled selected value="">부서</option>
                       <option value="4">인사팀</option>
                       <option value="3">식음팀</option>
                       <option value="1">경영지원팀</option>
                       <option value="5">구매/재무팀</option>
                       <option value="2">프론트/시설관리팀</option>
                    </select>
               </div>


				<div id="join-btn"><input type="submit" value="가입하기"></div>
				
               
        </div>

     </form>

    </div>

    <script>
        
        //아이디 숫자만 입력가능하게
        function checkId(id) {
            
            const value = id.value;
            const idRegex = /^[0-9]*$/;

            if(!idRegex.test(value)){
                alert('숫자만 입력 가능합니다.');
                id.value='';
            }

        }

        //input 태그 공백일때 경고문 뜨기
        function checkEmpty(idEmpty) {
            const value = idEmpty.value.trim();
            const errorMessage = idEmpty.nextElementSibling;

            if (value === '') {
                errorMessage.style.display = 'inline'; 
                idEmpty.focus(); 
            } else {
                errorMessage.style.display = 'none';
            }

        }

        //비밀번호 유효성 검사
        function checkPwd(pwd) {
            
            const pwdValue = pwd.value;
            const pwdRegex = /^(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,16}$/;
            const errorMessage = pwd.nextElementSibling;

            if(pwdValue==''){
                errorMessage.textContent = "* 비밀번호를 입력하세요."
                errorMessage.style.display = 'inline';
                pwd.focus();
            }
            else if(!pwdRegex.test(pwdValue)){
                errorMessage.textContent = '* 규칙에 맞게 작성하세요.';
                errorMessage.style.display = 'inline';
                pwd.focus();
            }else{
                errorMessage.style.display='none';
            }

        }
        
        //이메일 유효성 검사
        function checkEmail(params) {
            
        }
        


    </script>
        




</body>
</html>