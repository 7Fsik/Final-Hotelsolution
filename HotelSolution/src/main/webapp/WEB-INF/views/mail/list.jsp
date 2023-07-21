<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메일함</title>
    <link rel="stylesheet" href="${root}/resources/css/mail/list.css">
    <script defer src="${root}/resources/js/mail/list.js"></script>
    <style>

    </style>
</head>

<body>

<div id="wrap">

    <%@ include file="/WEB-INF/views/common/main.jsp" %>
        <div id="mainboard">

            <div class="main-content">
                <div class="write-btn">
                    <button id="mail-write-Btn" data-root="${root}">메일쓰기</button>
                </div>
                <hr class="mail-horizion">
                <nav class="mailCntAndSearchContainer">
                    <span class="total-mail-count">전체메일 1/1</span>
                    <select>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                    </select>
                    <input type="text" placeholder="검색할 내용을 입력해주세요">
                    <button>검색</button>
                </nav>
                <div class="mail-content-list">
                    <table>
                        <thead>
                        <tr>
                            <th><input type="checkbox"></input></th>
                            <th>읽음</th>
                            <th>삭제</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th><input type="checkbox"></input></th>
                            <td>작성자</td>
                            <td>작성내용</td>
                            <td>날짜</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </>
</div>

</body>
</html>
