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

    .password-area{
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
	
	.password-area > input{
		border: none;
        outline: none;
        font-size:20px;
	}

    /* @media(max-width: 768px){
        .login-area{
            flex-direction: column-reverse;
        }
    } */
    
    #code-btn{
    	margin: auto;
    	display : flex;
    	justify-content:center;
    }
    
   
    #code-btn > button{
    	width:200px;
    	height:30px;
    	font-size:20px;
    	color:white;
    	background-color:rgb(60, 59, 59);
    	border-radius: 5px;
    	border:1px solid rgb(60, 59, 59);
    	margin-top : 15px;
    	font-weight:700;
    	transition-duration: 0.5s;
    } 
    
     #code-btn > button:hover{
        cursor: pointer;
       background-color:#586b79;

    }
	
	#code-box{
		position:relative;
		right: 20px;
		display:flex;
		flex-direction:column;
		align-items:center;
	}
	
	.detail{
		margin-top:32px;
		font-weight: 700;
		letter-spacing: -.6px;
		margin-left:10px;
		position:relative;
		left:13px;
		font-size:15px;
	}
	
	.sub-input{
		color:white;
		background-color:rgb(60, 59, 59);
		border: 1px solid rgb(60, 59, 59);
		cursor: pointer;
	}
	
	.code-input{
		border:1px solid rgb(60, 59, 59);
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
            
            <div class="password-area">
                 <label for="name">ID</label>
                <input type="text" placeholder="휴대폰 번호를 입력하세요" maxlength="11">
            </div>
            
            <div class="password-area">
                 <label for="name">E-MAIL</label> 
                <input type="text" placeholder="이메일을 입력하세요">
            </div>

                    <div id="code-btn"><button type="button">인증코드 받기</button></div>
                   
                   <div id="code-box">
	                	<div class="detail">
		                	인증코드 <input class="code-input" type="text" name="code">
		                	<input class="sub-input" type="submit" value="확인">
	                	</div>
		                <ul class="list">
	                        <li>3분안으로 입력해주세요.</li>
	                        <li>메일함에서 인증코드를 확인해주세요.</li>
	                    </ul>
                   </div>

            </div>

     </form>

    </div>

    <script>

        const subMitBtn = document.querySelector('.sub-input');
        subMitBtn.addEventListener('click' , ()=>{
                //const no = '${vo.infoNo}'
				const width = 800;
				const height = 1000;
				const left = (screen.width/2) - (width/2);
				const top = 0;
				window.open('${root}/member/passwordReset?code='+1 ,'', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top )
        })

    </script>

</body>
</html>