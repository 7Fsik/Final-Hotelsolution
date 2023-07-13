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

    .passwordChange-area{
        font-size: 20px;
        display:flex;
        margin-bottom:40px;
        justify-content:center;
        margin-top: 70px;
    }
    
    label {
    	display:inline-block;
    	width:150px;
    }
	
	.passwordChange-area > input{
		border: none;
        outline: none;
        font-size:20px;
        padding: 3px;
        width:250px;
	}

    /* @media(max-width: 768px){
        .login-area{
            flex-direction: column-reverse;
        }
    } */
    #changePwdBtn{
    	margin: auto;
    	display : flex;
    	justify-content:center;
    	margin-top:60px;
    }
    
   
    #changePwdBtn > input{
    	width:300px;
    	height:40px;
    	font-size:30px;
    	color:white;
    	background-color:rgb(60, 59, 59);
    	border : 1px solid rgb(60, 59, 59);
    	border-radius: 5px;
    	margin-top : 15px;
    	font-weight:700;
    	transition-duration: 0.5s;
    } 
    
     #changePwdBtn > input:hover{
       cursor: pointer;
       background-color:#586b79;

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
            
            <div class="passwordChange-area">
                 <label for="name">PWD</label>
                <input type="password" placeholder="8~16자 대문자+특수문자" maxlength="16">
            </div>
            
            <div class="passwordChange-area">
                 <label for="name">PWD-CHECK</label> 
                <input type="password" placeholder="다시한번 입력하세요" maxlength="16">
            </div>

				
				<div id="changePwdBtn"><input type="submit" value="비밀번호 변경"></div>
                   

        </div>

     </form>

    </div>

    <script>


    </script>

</body>
</html>