<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
     body{
        background-color: rgba(217, 217, 217, 1);
        margin: 0px;
    }
    #dis{
        width: 73vw;
        height: 86vh;
        background-color: white;
    }
    

    #title{
        font-size: 40px;
        font-weight: bold;
        display: flex;
        justify-content: center;
        padding: 10px;
    }
    #int-area{
        height: 75%;
        width: 80%;
        position: relative;
        top: 5%;
        margin: auto;
        border: 3px  solid rgba(59, 68, 75, 1) ;
        border-radius: 10px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .img{
        width: 70%;
        height: 40%;
        background-color: antiquewhite;
    }
    .line{
        display: inline-block;
        border-bottom: 3px solid rgba(59, 68, 75, 1);
        
    }
    #user-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    #user-area2{
        display: grid;
        grid-template-columns: 2fr 1fr 1fr;
    }
    #userdate-area{
        width: 70%;
    }
    .text-left{
        text-align: left;
    }
    .font-25{
        font-size: 25px;
        font-weight: bold;
        margin: 8px;
    }
    .font-20{
        font-size: 20px;
    }
    #ch{
        height: 70px;
    }
    input{
        position: relative;
        top: 10px;
        width: 120px;
        height: 35px;
        border-radius: 5px;
        color: white;
        border: 0px;
        background-color: rgba(59, 68, 75, 1) ;
        font-weight: bold;
    }
    #re{
        display: flex;
        flex-direction: row-reverse;
    }
    #re>a{
        position: relative;
        right: 20px;
    }
    .main {
        width: 100%;
        height: 100%;
    }

    .main-container{
        width: 100%;
        height: 100%;
        background-color: #dedede;
        display: flex;
    }
    #area{
        
    }
    </style>
<body>
    <%@ include file="/WEB-INF/views/common/setup.jsp" %>
   
   
    <div id="wrap">

        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <%@ include file="/WEB-INF/views/common/aside.jsp" %>
      
        <main>
            <div class="main-container">
                
                <%@ include file="/WEB-INF/views/common/mainaside.jsp"%>
                <div id="area">
                    
                </div>
      
            
            </div>
        </main>
    </div>
        



</body>
</html>