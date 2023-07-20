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
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        border: 1px solid rgba(59, 68, 75, 1);
    }
    .img{
        height:50%;
        position: relative;
        top: 10px;
    }
    .name{
        font-size: 20px;
    }
    .ho{
        font-size: 15px;
    }
    .btn{
        height: 60px;
        display: flex;
        align-items: center;
    }
    button{
        height: 30px;
        width: 150px;
        border: 0px ;
        background-color:rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
    }
    

</style>
<body>

    <main>

        <div id="title">
            객실 상태관리
        </div>

        <div id="search-area">
            <div id="search">
                <form action="/fire/front/status/list">
                    <input type="hidden" name="page" value="1">
                    <select name="searchType" >
                        <option value="roomNo">방 호수</option>
                        <option value="statusNo">객실상태</option>
                        <option value="typeName">객실이름</option>
                    </select>
                    
                    <input type="text" name="searchValue">
                    <input type="submit" value="검색">
                </form>
            </div>
        </div>


        <div id="list-area">
            <div id="list">
                <c:forEach items="${svList}" var="svList">
                    <div class="att" onclick="location.href='/fire/front/status/detail?no='+${svList.roomIntNo}">
                    <div class="img">
	                        <img src="/fire/static/img/front/room001.jpg">
	                    </div>
	                    <div>
	                        <div class="name">${svList.typeName}</div>
	                        <div class="ho">${svList.roomNo} 호</div>
	                    </div>
                        <div class="btn">
                            <button>객실상태 : ${svList.status}</button>
                        </div>
	                </div>
				</c:forEach>
            </div>
            <div id="page-area">
                <c:if test="${pv.currentPage >1}">
                    <a href="/fire/front/status/list?page=1"> << </a>
                    <a href="/fire/front/status/list?page=${pv.currentPage - 1}"> < </a>
                </c:if>
                
                <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" step="1" var="i">
                    <a href="/fire/front/status/list?page= ${i}">${i}</a>
                </c:forEach>
                
                <c:if test="${pv.currentPage < pv.maxPage }">
                    <a href="/fire/front/status/list?page=${pv.maxPage}"> >> </a>            
                    <a href="/fire/front/status/list?page=${pv.currentPage + 1}"> > </a>
                </c:if>
            </div>
        </div>

    </main>

</body>
</html>