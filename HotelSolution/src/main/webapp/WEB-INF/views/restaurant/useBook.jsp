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
    main{
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
        font-size: 0.6em;
        align-items: center
    }
    button{
        border:0;
        background-color: rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
        font-size: 0.9em;
    }
    #table-area{
        width: 95%;
        height: 82%;
        display: grid;
        grid-template-rows: 1fr 1fr 1fr;
        grid-template-columns: repeat(7,1fr);
        margin: auto;
        grid-gap: 10px;
    }
    .t-bold{
        font-weight: bold;
    }
    .book-list{
        height: 63%;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .ss{
        font-size: 0.6em;
    }
    .book-int{
        display: grid;
        grid-template-rows: 1fr 1fr;
        border-top: 2px solid  rgba(59, 68, 75, 1);
        height: 30%;
    }
    .sidegrid{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    .ok{
        color: blue;
    }
    .no{
        color: red;
    }
    #search{
        position: relative;
        left: 70%;
        width: 30%;
        padding: 5px
    }
    
</style>
<body>

	<main>


        <div id="title">
            식당 테이블
        </div>
        <div id="search-area">
            <div id="search">
                예약 날짜 : 
                <input type="date">
            </div>
        </div>

        <div id="table-area">
            <c:forEach begin="1" end="21" var="i">
                <div class="table-int" >
                    <div class="table-num t-bold">
                        ${i}
                    </div>
                    <div class="book-list">
                        <div class="book-int">
                            <div class="ss"> 김찬진 (01012341234)</div>
                            <div class="sidegrid ss">
                                <div>17:00 4명   </div>
                                <div class="sidegrid">
                                    <div class="ok">확인 </div>
                                    <div class="no">취소</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-area">
                        <div >
                            최대인원 : 4명
                        </div>
                        <button>이용/예약</button>
                    </div>
                </div>
            </c:forEach>
        </div>
        

    </main>

</body>
</html>