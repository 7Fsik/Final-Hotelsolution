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

	#search-area > div:first-child{
		font-size:20px;
		font-weight:bold;
		margin-top:10px;
	}
	
	#search-bar{
		margin-top:15px;
	}
	
	#search-bar > input{
		width:200px;
	}
	
	#search-bar > button{
		width:50px;
		height:21.5px;
		background-color:white;
		border:1px solid black;
		box-sizing:border-box;
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
            	<div>결재선 설정</div>
            	<div id="search-bar">
	            	<input type="text" name="search" placeholder="이름,부서 검색">
	            	<button>검색</button>
            	</div>
            </div>
            
            <div id="main-area">
            
            	<div id="">
	            	<div>조직도</div>	
            	</div>
				            
            </div>
                   

        </div>

     </form>

    </div>

    <script>


    </script>

</body>
</html>