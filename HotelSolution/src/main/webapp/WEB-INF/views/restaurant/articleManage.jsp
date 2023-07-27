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
    #search-area{
        display: flex;
        flex-direction: row;
        justify-content: space-around;
    }
    #list-area{
        width: 76%;
        height: 75%;
        margin: 0 auto;
        padding: 10px;
    }
    #ttt{
        width: 100%;
        text-align: center;
        border-collapse: collapse;
        
    }
    .bl{
        border: 1px solid black;
    }
    #hhh{
        background-color: rgba(59, 68, 75, 1);
        color: white;
        height: 50px;
    }
    tbody{
        height: 30px;
    }
    td>input[type="text"]{
        width: 50%;
        border: 0px;
        text-align: end;
    }
    td>input[type="button"]{
        background-color:  rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
    }
    .mi{
        vertical-align: middle;
        text-align: center;
    }
</style>
<body>

	<div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
     
        <div id="mainboard">
     
           <div id="title">
                 물품 재고관리
             </div>
             <div id="search-area">
                 <div id="search">
                     <select name="" id="">
                         <option value="">물품 종류</option>
                         <option value="">물품 이름</option>
                     </select>
                     <input type="text">
                     <input type="submit" value="검색">
                 </div>
     
                 <div>
                     * 수량만 수정할 수 있습니다 
                 </div>
             </div>
     
             <div id="list-area">
                 <table id="ttt">
                     <thead id="hhh">
                         <tr>
                             <th class="bl mi" style="width: 12.5%;">물품 번호</th>
                             <th class="bl mi" style="width: 25%;">물품 종류</th>
                             <th class="bl mi" style="width: 25%;">물품 이름</th>
                             <th class="bl mi" style="width: 12.5%;">가격</th>
                             <th class="bl mi" style="width: 12.5%;">수량</th>
                             <th class="bl mi" style="width: 12.5%;"></th>
                         </tr>
                     </thead>
                     <tbody>
                         <c:forEach begin="1" end="15">
                             <tr>
                                 <td class="bl mi">1</td>
                                 <td class="bl mi">야채</td>
                                 <td class="bl mi">파</td>
                                 <td class="bl mi">10000 원</td>
                                 <td class="bl mi">
                                     <input type="text" value="10">개
                                 </td>
                                 <td class="bl mi">
                                     <input type="button" value="수정">
                                 </td>
                             </tr>
                         </c:forEach>
                     </tbody>
                 </table>
             </div>
     
             <div>
                 <button>발주하러가기</button>
             </div>
        
        </div>
     
     </div>

</body>
</html>