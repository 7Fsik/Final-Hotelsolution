<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    #search-area{
        display: flex;
        justify-content: flex-end;
    }
    #search{
        position: relative;
        right: 20px;
    }


    #list-area{
        width: 95%;
        height: 80%;
        margin: auto;

    }
    #list{
        width: 100%;
        height: 95%;
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        align-items: center;
        justify-items: center;
    }

    #page-area{
        display: flex;
        justify-content: center
    }
    .att{
        height: 90%;
        width: 90%;
        background-color: antiquewhite;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
    }
    .img{
        height:50%;
    }
    .name{
        font-size: 20px;
    }
    .int{
        font-size: 13px;
    }
    .ho{
        font-size: 15px;
    }
    .date{
        font-size: 15px;
    }

</style>
<body>

    <main>

        <div id="title">
            객실 예약관리
        </div>

        <div id="search-area">
            <div id="search">
                <select name="" id="">
                    <option value="">손님 이름</option>
                </select>
                
                <input type="text">
            </div>
        </div>

        <div id="list-area">
            <div id="list">
	            <c:forEach begin="1" end="8">
	                <div class="att">
	                    <div class="img">
	                        <img src="/fire/static/img/front/room001.jpg">
	                    </div>
	                    <div>
	                        <div class="name">방이름</div>
	                        <div class="ho">호수</div>
	                        <div class="int">손님정보</div>
	                        <div class="date">이용일</div>
	                    </div>
	                </div>
				</c:forEach>
            </div>
            <div id="page-area">
                이전 1 2 3 4 5 6 7 8 9 10 다음
            </div>
        </div>

    </main>

</body>
</html>