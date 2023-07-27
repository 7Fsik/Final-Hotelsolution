<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    #mainboard{
        border-radius: 10px;
        background-color: white;
    }

    #title{
        font-size: 40px;
        font-weight: bold;
        display: flex;
        justify-content: center;
        padding: 10px;
    }
    #time{
        position: relative;
        left: 80%;
        width: 300px;
    }
    .table-int{
        border: 3px solid rgba(59, 68, 75, 1);
       
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        border-radius: 10px;
    }
    .btn-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 3px;
        height: 15%;
        position: relative;
        bottom: 2px;
    }
    .bb{
        border:0;
        background-color: rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
    }
    #table-area{
        width: 95%;
        height: 83%;
        display: grid;
        grid-template-rows: 1fr 1fr 1fr;
        grid-template-columns: repeat(7,1fr);
        margin: auto;
        grid-gap: 10px;
    }
    .t-bold{
        font-weight: bold;
    }
    
</style>
<body>

	<div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
     
        <div id="mainboard">
     
           <div id="time">
                 2023-07-17  20:05:40
             </div>
     
             <div id="title">
                 식당 테이블
             </div>
     
             <div id="table-area">
                 <c:forEach begin="1" end="21" var="i">
                     <div class="table-int" >
                         <div class="table-num t-bold">
                             ${i}
                         </div>
                         <div class="table-price">
                             180000 원 
                         </div>
                         <div class="btn-area">
                             <button class="bb">메뉴주문</button>
                             <button class="bb">결제하기</button>
                         </div>
                     </div>
                 </c:forEach>
             </div>
        
        </div>
     
     </div>

</body>
</html>