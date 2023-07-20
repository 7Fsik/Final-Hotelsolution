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
    <script defer src="${root}/resources/js/companyboard/list.js"></script>
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
                        <button id="writeBtn2" data-root="${root}">글쓰기</button>
                    </nav>
                    <hr class="main-horizon-line">

                    <div class="main-board-list">

                        <div class="container">
                            <table class="table table-striped table-responsive">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>부서</th>
                                    <th>작성자</th>
                                    <th>조회수</th>
                                    <th>작성일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allCompanyBoardList}" var="board">
                                    <tr>
                                        <td>${board.no}</td>
                                        <td>${board.title}</td>
                                        <td>부서</td>
                                        <td>작성자</td>
                                        <td>${board.hit}</td>
                                        <td>${board.enrollDate}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>


                        <div class="page-area">
                            <c:if test="${pv.currentPage > 1}">
                                <a class="btn btn-primary" href="${root}/board/list/${pv.currentPage - 1}">이전</a>
                            </c:if>
                            <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                                <c:choose>
                                    <c:when test="${pv.currentPage != i}">
                                        <a class="btn btn-primary btn-sm" href="${root}/board/list/${i}">${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-primary btn-sm">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${pv.currentPage < pv.maxPage}">
                                <a class="btn btn-primary btn-sm" href="${root}/board/list/${pv.currentPage + 1}">다음</a>
                            </c:if>
                        </div>


                    </div>
                    <div class="weekly-board-list">
                        <h3>주간 인기 게시글</h3>
                    </div>
                </div>
            </div>
        </main>

    </div>

</body>
</html>