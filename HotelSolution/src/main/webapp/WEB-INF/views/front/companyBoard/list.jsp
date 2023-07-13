<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사내게시판 목록조회합시다</title>
    <link rel="stylesheet" href="${root}/resources/css/companyboard/list.css">
</head>
<body>

    <div id="wrap">

        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <%@ include file="/WEB-INF/views/common/aside.jsp" %>

        <main>
            <div class="main-container">
                <aside class="main-aside">
                    <div class="profile-box"></div>
                    <div class="main-aside-empty"></div>
                    <div class="team-menu-bar"></div>
                </aside>
                <div class="main-content-list">
                    <nav>
                        <input type="text" placeholder="검색">
                        <input type="submit" value="글쓰기">
                    </nav>
                    <hr class="main-horizon-line">
                    <div class="main-board-list"></div>
                    <div class="weekly-board-list">
                        <h3>주간 인기 게시글</h3>
                    </div>
                </div>
            </div>
        </main>

    </div>

</body>
</html>