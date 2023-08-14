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
        grid-template-rows: 1fr 1fr;
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
        justify-content: space-around;
        position: relative;
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
    .useBtn{
        height: 30px;
        width: 150px;
        border: 0px ;
        background-color:rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
    }
    .soldOut{
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 100;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 2em;
        font-style: oblique;
        font-weight: bolder;
        border-radius: 10px;
    }
    .btnrr{
        color: red;
    }
    .img>img{
        height: 90%;
        width: 90%;
        border-radius: 5px;
    }
    .useBtn:hover{
        cursor: pointer;
        background-color: rgb(86 93 98);
    }
    input:hover{
        cursor: pointer;
        background-color: rgb(181, 193, 202);
    }
    

</style>
<body>

    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
    
        <div id="mainboard">
            <div id="title">
                이용/예약 가능한 객실
            </div>
    
            <div id="search-area">
                <div id="search">
	                <form action="${root}/front/useBook/list" >
                        <select name="searchType" id="searchType">
                            <option class="st" value="0">전체</option>
                            <option class="st" value="1">포레스트뷰 스탠다드</option>
                            <option class="st" value="2">오션뷰 스탠다드</option>
                            <option class="st" value="3">포레스트뷰 프리미어 더블</option>
                            <option class="st" value="4">오션뷰 프리미어 더블</option>
                            <option class="st" value="5">포레스트뷰 스위트룸</option>
                            <option class="st" value="6">오션뷰 스위트룸</option>
                        </select>
	                    <span>시작날짜 : </span>
	                    <input type="date" id="startDate" name="startDate" value="${paramMap.startDate}">
	                    <span>끝날짜 : </span>
	                    <input type="date" id="endDate" name="endDate" value="${paramMap.endDate}">
						<input type="submit" value="검색">
	                </form>
                </div>
            </div>
    
            <div id="list-area">
                <div id="list">
                    <c:forEach items="${voList}" var="vo">
                        <div class="att" >
                            <div class="img">
                                <img src="${root}/resources/img/front/${vo.img}">
                            </div>
                            <div>
                                <div class="name">${vo.typeName}</div>
                                <div class="ho">${vo.roomNo}</div>
                                <div>금액 : <span>${vo.totalPrice}</span>원</div>
                            </div>
                            <div class="btn">
                                <button class="useBtn" onclick="location.href='${root}/front/useBook/detail?no=${vo.roomIntNo}&startDate=${paramMap.startDate}&endDate=${paramMap.endDate}'"> 이용/예약하기 </button>
                            </div>
                            <c:forEach items="${bookList}" var="book">
                            	<c:if test="${book.roomIntNo == vo.roomIntNo}">
		                            <div class="soldOut">
		                                SOLD OUT!
		                            </div>
                            	</c:if>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
                <div id="page-area">
                    <c:if test="${pv.currentPage >1}">
                        <a href="/fire/front/useBook/list?page=${pv.currentPage - 1}&startDate=${paramMap.startDate}&endDate=${paramMap.endDate}&searchType=${paramMap.searchType}"> < </a>
                    </c:if>
                    
                    <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" step="1" var="i">
                        <c:if test="${pv.currentPage != i}">
                            <a href="/fire/front/useBook/list?page= ${i}&startDate=${paramMap.startDate}&endDate=${paramMap.endDate}&searchType=${paramMap.searchType}">${i}</a>
	            		</c:if>
	            		<c:if test="${pv.currentPage == i}">
			            	<a class="btnrr">${i}</a>
	            		</c:if>
                    </c:forEach>
                    
                    <c:if test="${pv.currentPage < pv.maxPage }">
                        <a href="/fire/front/useBook/list?page=${pv.currentPage + 1}&startDate=${paramMap.startDate}&endDate=${paramMap.endDate}&searchType=${paramMap.searchType}"> > </a>
                    </c:if>
                </div>
            </div>
        </div>
    
    </div>

<script>

    const startDate = document.querySelector("#startDate").value;
    const endDate = document.querySelector("#endDate").value;

    const desiredValue = '${paramMap.searchType}';
    const selectElement = document.getElementById("searchType");
    const optionElements = selectElement.querySelectorAll(".st");

    for (const option of optionElements) {
        if (option.value === desiredValue) {
            option.selected = true;
            break; 
        }
    }




</script>

</body>
</html>