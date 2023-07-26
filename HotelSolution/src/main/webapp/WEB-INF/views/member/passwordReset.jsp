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

    .input-area {
    position: relative;
    }
	
	.input-area > input{
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

    .errorMessage{
		font-size:15px;
		position: absolute;
        top: 100%;
        left: 0;
        color: red;

    }

</style>
</head>
<body>

	<div id="wrap">

    <form action="${root}/member/passwordReset" method="post">
        <div id="box">
            <div id="logo">
                <img style="width: 300px;" src="${root}/resources/img/호텔솔루션.png" alt="">
            </div>
            
            <div class="passwordChange-area">
                 <label for="name">PWD</label>
                <div class="input-area">
                    <input name="password" type="password" placeholder="8~16자 대문자+특수문자" maxlength="16" oninput="checkPwd(this);" onblur="checkEmpty(this);">
                    <div class="errorMessage" style="display: none; ">* 변경하실 비밀번호를 입력하세요.</div>
                </div>
            </div>
            
            <div class="passwordChange-area">
                 <label for="name">PWD-CHECK</label> 
                <div class="input-area">
                   <input name="passwordAgain" type="password" placeholder="다시한번 입력하세요" maxlength="16" oninput="duplicationCheck(this);" onblur="checkEmpty(this)">
                   <div class="errorMessage" style="display: none; ">*  비밀번호를 다시 입력하세요.</div>
                </div>
            </div>

            <input type="hidden" name="email" value="${param.email}">

				
				<div id="changePwdBtn">
                    <input type="submit" value="비밀번호 변경" onclick="return changeYesOrNo();">
                </div>
                   

        </div>

     </form>

    </div>

    <script>

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
            const pwdValue = pwd.value.trim();
            const pwdRegex = /^(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,16}$/;
            const errorMessage = pwd.nextElementSibling;
            
            if(!pwdRegex.test(pwdValue)){
                errorMessage.textContent = '* 규칙에 맞게 작성하세요.';
                errorMessage.style.display = 'inline';
                console.log(pwd);
                pwd.style.backgroundColor='red';
                pwd.focus();
            }

        }

        //비밀번호 중복검사
        function duplicationCheck(pwd) {
            const x = document.querySelector('input[name=password]');
            

            const pwdValue = x.value.trim();
            const pwdRegex = /^(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,16}$/;
            const errorMessage = x.nextElementSibling;
            
            if(!pwdRegex.test(pwdValue)){
                errorMessage.textContent = '* 규칙에 맞게 작성하세요.';
                errorMessage.style.display = 'inline';
                console.log(x);
                x.style.backgroundColor='red';
                x.focus();
            }

            // const password = document.querySelector('input[name=password]').value;
            // const changePassword = document.querySelector('input[name=passwordAgain]').value;

            
            // const pwdValue = pwd.value.trim();
            // const pwdRegex = /^(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,16}$/;
            // const errorMessage = pwd.nextElementSibling;
            
            // if(password != changePassword){
            //     errorMessage.textContent = "* 비밀번호가 일치하지 않습니다."
            //     errorMessage.style.display = 'inline';
            //     pwd.focus();
            // }else{
            //     errorMessage.textContent = "* 비밀번호가 일치합니다"
            //     errorMessage.style.display = 'inline';
                
            // }

        }
        
        //비밀번호 일치하면 변경
        function changeYesOrNo(params) {
            const password = document.querySelector('input[name=password]').value;
            const changePassword = document.querySelector('input[name=passwordAgain]').value;

            if(password == changePassword){
                alert('비밀번호가 변경되었습니다.');
                return true;
            }else if(password != changePassword){
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }
        }
       



    </script>

</body>
</html>