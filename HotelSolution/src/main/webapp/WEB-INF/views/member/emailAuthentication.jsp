<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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

    <form action="" method="post">
        <div id="box">
            <div id="logo">
                <img style="width: 300px;" src="${root}/resources/img/호텔솔루션.png" alt="">
            </div>
            
            <div class="password-area">
                 <label for="name">ID</label>
                <input name="id" type="text" placeholder="휴대폰 번호를 입력하세요" maxlength="11">
            </div>
            
            <div class="password-area">
                 <label for="name">E-MAIL</label> 
                <input name="email" type="email" placeholder="이메일을 입력하세요">
            </div>

                    <div id="code-btn"><button type="button" formaction="${root}/member/emailAuthentication.wow">인증번호 받기</button></div>
                   
                   <div id="code-box">
	                	<div class="detail">
		                	인증번호 <input class="code-input" type="text" name="code" maxlength="6" placeholder="인증번호 6자리 입력">
		                	<input formaction="${root}/member/emailKeyRightOrNo" class="sub-input" type="submit" value="확인">
	                	</div>
		                <ul class="list">
	                        <li>입력하신 메일에서 인증번호를 확인해주세요.</li>
	                    </ul>
                   </div>

            </div>

     </form>

    </div>

    <script>
        
        //ID , EMAIL 맞는지 확인하고 맞으면 메일보내기
        const Btn = document.querySelector('#code-btn');
        Btn.addEventListener('click' , function (params) {
            const id = document.querySelector('input[name=id]').value;
            const email = document.querySelector('input[name=email]').value;
            $.ajax({
               type : "post",
               url : '${root}/member/emailAuthentication',
               dataType : 'text',
               data : {
                id : id,
                email : email,
               },
               success : (data)=>{
                console.log('통신 성공');
                if(data === "success"){
                    alert('인증번호가 발송되었습니다.');
                    const email = document.querySelector('input[name=email]').value;
                    $.ajax({
                        type : 'post',
                        url : '${root}/member/emailAuthentication.wow',
                        data : {
                            email : email,
                        },
                        success : function (data) {
                            console.log(data);
                        },
                        error : function (e) {
                            console.log(e);
                        }
                    })
                }else{
                    alert('아이디 혹은 이메일을 다시 입력해주세요.');
                }
               },
               error : (e)=>{
                alert('아이디 혹은 이메일을 다시 입력해주세요.');
               },
            });      
            
        });

        const subMitBtn = document.querySelector('.sub-input');
        
        subMitBtn.addEventListener('click' , (event)=>{
            event.preventDefault();
            const code = document.querySelector('input[name=code]').value;
            const email = document.querySelector('input[type=email]').value;
        $.ajax({
            type : "post",
            url : "${root}/member/emailKeyRightOrNo",
            dataType : 'text',
            data : {
                email : email,
                code : code
            },
            success : function(data) {
                if(data == "success"){
                    alert('인증번호 확인완료');
                    window.location.href = "${root}/member/passwordReset?email="+encodeURIComponent(email);
                }else{
                    alert('인증번호를 다시 확인해주세요');
                    const code = document.querySelector('input[name=code]').value = '';
                }
            },
            error : function(e) {
                console.log(e);
            }
        });

        })

    </script>

</body>
</html>