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
        padding: 30PX;
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
        justify-content: space-around;
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
    .bbb{
        height: 40px;
        width: 180px;
        border: 0px ;
        background-color:rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
    }
    .img>img{
        height: 90%;
        width: 90%;
        border-radius: 5px;
    }
    #checkSelect{
        display: none;
    }
    #bttb{
        border: 0px;
        background-color: rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
        height: 100%;
    }

</style>
<body>

    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
    
        <div id="mainboard">
            <div id="title">
                객실 상태관리
            </div>
    
            <div id="search-area">
                <div id="search">
                    <form action="${root}/front/status/list">
                        <input type="hidden" name="page" value="1">
                        <select name="searchType" id="searchType" value="${searchType}">
                            <option value="roomNo">방 호수</option>
                            <option value="statusNo">객실상태</option>
                            <option value="typeName">객실이름</option>
                        </select>
                        <input type="text" name="searchValue" id="searchValue" value="${searchValue}" style="display: inline-block;" >
                        <select name="checkSelect" id="checkSelect" style="display: none;">
                            <option value="1">사용가능</option>
                            <option value="2">수리중</option>
                        </select>
                        <input type="submit" value="검색" id="bttb">
                    </form>
                </div>
            </div>
    
    
            <div id="list-area">
                <div id="list">
                    <c:forEach items="${svList}" var="svList">
                        <div class="att" onclick="location.href='/fire/front/status/detail?no='+${svList.roomIntNo}">
                        <div class="img">
                                <img src="${root}/resources/img/front/${svList.img}">
                            </div>
                            <div>
                                <div class="name">${svList.typeName}</div>
                                <div class="ho">${svList.roomNo} 호</div>
                            </div>
                            <div class="btn">
                                <button class="bbb">객실상태 : ${svList.status}</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="page-area">
                    <c:if test="${pv.currentPage >1}">
                        <a href="/fire/front/status/list?page=1&searchType=${searchType}&searchValue=${searchValue}"> << </a>
                        <a href="/fire/front/status/list?page=${pv.currentPage - 1}&searchType=${searchType}&searchValue=${searchValue}"> < </a>
                    </c:if>
                    
                    <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" step="1" var="i">
                        <a href="/fire/front/status/list?page= ${i}&searchType=${searchType}&searchValue=${searchValue}">${i}</a>
                    </c:forEach>
                    
                    <c:if test="${pv.currentPage < pv.maxPage }">
                        <a href="/fire/front/status/list?page=${pv.maxPage}&searchType=${searchType}&searchValue=${searchValue}"> >> </a>            
                        <a href="/fire/front/status/list?page=${pv.currentPage + 1}&searchType=${searchType}&searchValue=${searchValue}"> > </a>
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
        
        var checkSelect = document.getElementById('checkSelect');
        var searchValue = document.getElementById('searchValue');

        if (select.value === 'statusNo') {
            checkSelect.style.display = 'inline-block';
            searchValue.style.display = 'none';
            searchValue.disabled = true;
        } else {
            checkSelect.style.display = 'none';
            searchValue.style.display = 'inline-block';
            searchValue.disabled = false;
        }

    </script>

    

</body>
</html>