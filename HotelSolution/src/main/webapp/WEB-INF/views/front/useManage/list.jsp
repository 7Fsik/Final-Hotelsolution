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
        height: 84%;
        margin: auto;

    }
    #list{
        width: 100%;
        height: 95%;
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        grid-template-rows: 50% 50%;
        align-items: center;
        justify-items: center;
    }

    #page-area{
        display: flex;
        justify-content: space-around;
        width: 40%;
        position: relative;
        left: 30%;
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
        justify-content: space-evenly;
    }
    .img{
        height:50%;
        position: relative;
        top: 10px;
        width: 90%;
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
    .btbt{
        height: 30px;
        width: 150px;
        border: 0px ;
        background-color:rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
    }
    .img>img{
        width: 90%;
        height: 90%;
        border-radius: 5px;
    }
    .btnrr{
        color: red;
    }
    .btbt:hover{
        cursor: pointer;
        background-color: rgb(86 93 98);
    }
    
    

</style>
<body>

    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
    
        <div id="mainboard">
            <div id="title">
                객실 이용관리
            </div>
    
            <div id="search-area">
                <div id="search">
                    <form action="${root}/front/useManage/list">
                        <input type="text" name="searchValue" placeholder="방 호수를 입력하시오 ">
                        <input type="submit" value="검색">
                    </form>
                </div>
            </div>
    
            <div id="list-area">
                <div id="list">
                    <c:forEach items="${useList}" var="useList">
                        <div class="att"onclick="location.href='/fire/front/useManage/detail?no=${useList.roomUseNo}'">
                            <div class="img">
                                <img src="${root}/resources/img/front/${useList.img}">
                            </div>
                            <div>
                                <div class="name">${useList.typeName}</div>
                                <div class="ho">${useList.roomNo} 호</div>
                            </div>
                            <div class="btn">
                                <button class="btbt">이용내역</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="page-area">
                    <c:if test="${pv.currentPage >1}">
                        <a href="/fire/front/useManage/list?page=${pv.currentPage - 1}&searchValue=${searchValue}"> < </a>
                    </c:if>
                    
                    <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" step="1" var="i">
                        <c:if test="${pv.currentPage != i}">
                            <a href="/fire/front/useManage/list?page= ${i}&searchValue=${searchValue}">${i}</a>
	            		</c:if>
	            		<c:if test="${pv.currentPage == i}">
			            	<a class="btnrr">${i}</a>
	            		</c:if>
                    </c:forEach>
                    
                    <c:if test="${pv.currentPage < pv.maxPage }">
                        <a href="/fire/front/useManage/list?page=${pv.currentPage + 1}&searchValue=${searchValue}"> > </a>
                    </c:if>
                </div>
            </div>
        </div>
    
    </div>

</body>
</html>