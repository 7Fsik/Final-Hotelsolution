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
        position: relative;
    }
    .img{
        height:50%;
        width: 90%;
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
    #searchb{
        border: 0;
        border-radius: 5px;
        color: white;
        background-color:rgba(59, 68, 75, 1);
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
        font-size: 1.5em;
        font-style: oblique;
        font-weight: bolder;
        border-radius: 10px;
    }
    .img>img{
        width: 90%;
        height: 90%;
        border-radius: 5px;
    }
    .att2{
        height: 90%;
        width: 90%;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
       
        position: relative;
    }
    .btnrr{
        color: red;
    }
    .att2:hover{
        cursor: pointer;
        background-color: rgb(220, 226, 231);
    }
    #searchb:hover{
        cursor: pointer;
        background-color: rgb(86 93 98);
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
                        <select name="searchType" id="searchType" >
                            <option value="name">손님 이름</option>
                            <option value="phoneNumber">전화 번호</option>
                        </select>
                        
                        <input type="text" name="searchValue" value="${searchValue}">
                        <input type="submit" id="searchb" value="검색">
                    </form>
                </div>
            </div>
    
            <div id="list-area">
                <div id="list">
                    <c:forEach items="${bmList}" var="bmList">
                        <div class="att" >
                            <div class="att2" onclick="location.href='/fire/front/bookManage/detail?no='+${bmList.no}">
                                <div class="img">
                                    <img src="${root}/resources/img/front/${bmList.img}">
                                </div>
                                <div class="fff">
                                    <div class="name blk ggg">${bmList.typeName}</div>
                                    <div class="ho blk ggg">${bmList.roomNo}</div>
                                    <div class="int blk ggg">손님정보 : ${bmList.name}(${bmList.phoneNumber})</div>
                                    <div class="date blk ggg">이용 날짜 :${bmList.startDate} ~ ${bmList.endDate} </div>
                                </div>
                            </div>
                            <c:forEach items="${useList}" var="use">
                            	<c:if test="${use.no == bmList.no}">
		                            <div class="soldOut">
		                                체크인 완료
		                            </div>
                            	</c:if>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
                <div id="page-area">
                    <c:if test="${pv.currentPage >1}">
                        <a href="/fire/front/bookManage/list?page=${pv.currentPage - 1}&searchType=${searchType}&searchValue=${searchValue}"> < </a>
                    </c:if>
                    
                    <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" step="1" var="i">
                        <c:if test="${pv.currentPage != i}">
                            <a href="/fire/front/bookManage/list?page= ${i}&searchType=${searchType}&searchValue=${searchValue}">${i}</a>
	            		</c:if>
	            		<c:if test="${pv.currentPage == i}">
			            	<a class="btnrr">${i}</a>
	            		</c:if>
                    </c:forEach>
                    
                    <c:if test="${pv.currentPage < pv.maxPage }">
                        <a href="/fire/front/bookManage/list?page=${pv.currentPage + 1}&searchType=${searchType}&searchValue=${searchValue}"> > </a>
                    </c:if>
                </div>
            </div>
        </div>
    
    </div>
<script>
    const select = document.getElementById("searchType");
    const options = select.options;
    for (let i = 0; i < options.length; i++) {
        if (options[i].value === '${searchType}') {
            options[i].selected = true;
            break; // 선택된 옵션을 찾았으므로 루프 종료
        }
    }



</script>

</body>
</html>