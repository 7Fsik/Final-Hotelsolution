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
        height: 500px;
        border: 1px solid #3B444B;
        border-radius: 10px;
        margin: 0 auto;
    }
    
    #logo{
        display: flex;
        justify-content: center;
        margin-top : 30px;
    }

    .login-area{
        font-size: 20px;
        display:flex;
        margin-bottom:40px;
        justify-content:center;
        margin-top: 70px;
    }
    
    label {
    	display:inline-block;
    	width:100px;
    }
	
	.login-area > input{
		border: none;
        outline: none;
        font-size:20px;
        padding: 3px;
	}

    /* @media(max-width: 768px){
        .login-area{
            flex-direction: column-reverse;
        }
    } */
    
    #login-btn{
    	margin: auto;
    	display : flex;
    	justify-content:center;
    }
    
   
    #login-btn > input{
    	width:300px;
    	height:50px;
    	font-size:30px;
    	color:white;
    	background-color:rgb(60, 59, 59);
    	border : 1px solid rgb(60, 59, 59);
    	border-radius: 5px;
    	margin-top : 15px;
    	font-weight:700;
    	transition-duration: 0.5s;
    } 
    
     #login-btn > input:hover{
        cursor: pointer;
       background-color:#586b79;

    }
	
	
	#detail{
		display : flex;
		margin-top:32px;
		justify-content:space-evenly;
		font-weight: 700;
		letter-spacing: -.6px;
		margin-left:10px;
	}

</style>
</head>
<body>

	<div id="wrap">

    <form action="${root}/member/login" method="post">
        <div id="box">
            <div id="logo">
                <img style="width: 300px;" src="${root}/resources/img/호텔솔루션.png" alt="">
            </div>
            
            <div class="login-area">
                 <label for="name">ID</label>
                <input name="id" type="text" placeholder="휴대폰 번호를 입력하세요" maxlength="11">
            </div>
            
            <div class="login-area">
                 <label for="name">PWD</label> 
                <input name="password" type="password" placeholder="비밀번호를 입력하세요">
            </div>

				<div id="login-btn"><input type="submit" value="로그인"></div>
				
            <div id="detail">
				<a href="${root}/member/join">회원가입</a>
				<a href="${root}/member/emailAuthentication">비밀번호 재설정</a>
			</div>      
        </div>

     </form>

    </div>

</body>
</html>