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
    #mainboard{
        
        background-color: white;
        border-radius: 10px;
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
    .fff{
        display: flex;
        flex-direction: column;
    }
    .ggg{
        padding: 5px;
    }
    .blk{
        display: inline-block;
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
    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
    
        <div id="mainboard">
            <div id="title">
                객실 예약관리
            </div>
    
            <div id="search-area">
                <div id="search">
                    <form action="/fire/front/bookManage/list">
                        <input type="hidden" name="page" value="1">
                        <select name="searchType" >
                            <option value="name">손님 이름</option>
                            <option value="phoneNumber">전화 번호</option>
                        </select>
                        
                        <input type="text" name="searchValue">
                        <input type="submit" value="검색">
                    </form>
                </div>
            </div>
    
            <div id="list-area">
                <div id="list">
                    <c:forEach items="${bmList}" var="bmList">
                        <div class="att" onclick="location.href='/fire/front/bookManage/detail?no='+${bmList.no}">
                            <div class="img">
                                <img src="/fire/static/img/front/room001.jpg">
                            </div>
                            <div class="fff">
                                <div class="name blk ggg">${bmList.typeName}</div>
                                <div class="ho blk ggg">${bmList.roomNo}</div>
                                <div class="int blk ggg">손님정보 : ${bmList.name}(${bmList.phoneNumber})</div>
                                <div class="date blk ggg">이용 날짜 :${bmList.startDate} ~ ${bmList.endDate} </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="page-area">
                    <c:if test="${pv.currentPage >1}">
                        <a href="/fire/front/bookManage/list?page=1"> << </a>
                        <a href="/fire/front/bookManage/list?page=${pv.currentPage - 1}"> < </a>
                    </c:if>
                    
                    <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" step="1" var="i">
                        <a href="/fire/front/bookManage/list?page= ${i}">${i}</a>
                    </c:forEach>
                    
                    <c:if test="${pv.currentPage < pv.maxPage }">
                        <a href="/fire/front/bookManage/list?page=${pv.maxPage}"> >> </a>            
                        <a href="/fire/front/bookManage/list?page=${pv.currentPage + 1}"> > </a>
                    </c:if>
                </div>
            </div>
        </div>
    
    </div>


</body>
</html>