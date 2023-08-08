<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사내게시판 목록조회합시다</title>

</head>

<body>


    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/main.jsp" %>
        <link rel="stylesheet" href="${root}/resources/css/companyboard/list.css">
        <script defer src="${root}/resources/js/companyboard/list.js"></script>

        <div id="mainboard">
                <div class="main-content-list">
                    <nav>
                        <div class="input-group mb-3">
                            <form action="${root}/board/list/1" method="get">
                                 <span>
                                  <select class="btn btn-secondary" name="searchType">
                                        <option value="title">제목</option>
                                        <option value="content">내용</option>
                                  </select>
                                   <label>
                                    <input id="board-search-input" type="text" placeholder="검색할내용을입력해주세요" class="form-control" name="searchValue">
                                    </label>
                                    <input class="btn btn-primary" type="submit" value="검색">
                                </span>
                            </form>
                        </div>
                        <button id="writeBtn2" data-root="${root}" class="btn btn-primary">글쓰기</button>
                    </nav>
                    <hr class="main-horizon-line">

                    <div class="main-board-list">

                        <div class="container">
                            <table class="table table-striped table-responsive table-hover">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>부서</th>
                                    <th>작성자</th>
                                    <th>조회수</th>
                                    <th>작성일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allCompanyBoardList}" var="board">
                                    <tr class="clickable-row" data-no="${board.no}"  data-root="${root}">
                                        <td>${board.no}</td>
                                        <td>${board.title}</td>
                                        <td>${board.content}</td>
                                        <td>${board.teamName}</td>
                                        <td>${board.writerName}</td>
                                        <td>${board.hit}</td>
                                        <td>${board.elapsedSinceEnrollDate}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="page-area">
                                <c:if test="${pv.currentPage > 1}">
                                    <a class="btn btn-primary" href="${root}/board/list/${pv.currentPage - 1}?searchType=${paramMap.searchType}&searchValue=${paramMap.searchValue}">이전</a>
                                </c:if>
                                <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
                                    <c:choose>
                                        <c:when test="${pv.currentPage != i}">
                                            <c:if test="${not empty paramMap.searchType and not empty paramMap.searchValue}">
                                                <a class="btn btn-primary btn-sm" href="${root}/board/list/${i}?searchType=${paramMap.searchType}&searchValue=${paramMap.searchValue}">${i}</a>
                                            </c:if>
                                            <c:if test="${empty paramMap.searchType or empty paramMap.searchValue}">
                                                <a class="btn btn-primary btn-sm" href="${root}/board/list/${i}">${i}</a>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-primary btn-sm">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${pv.currentPage < pv.maxPage}">
                                    <a class="btn btn-primary btn-sm" href="${root}/board/list/${pv.currentPage + 1}?searchType=${paramMap.searchType}&searchValue=${paramMap.searchValue}">다음</a>
                                </c:if>
                            </div>
                        </div>



                        <div class="weekly-board-list">
                            <h3>주간 인기 게시글</h3>
                            <div id="weekly-board-list"></div>
                        </div>


                    </div>

                </div>
            </div>

    </div>

</body>
</html>

<script>
    $(document).ready(function () {
        function getWeeklyTopBoardList() {
            $.ajax({
                url: "${root}/board/week",
                type: "GET",
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $('#weekly-board-list').empty();
                    $.each(data, function (index, item) {
                        let hiddenNo = '<input type="hidden" value="' + item.no + '">';
                        let title = '<div class="post-title mb-2"><a href="' + "${root}" + '/board/detail?no=' + item.no + '" class="text-decoration-none text-dark">' + item.title + '</a></div>';
                        let content = '<div class="post-content mb-3">' + item.content + '</div>';
                        let postWrapper = '<div class="single-post-wrapper border rounded p-3 mb-4" data-url="' + "${root}" + '/board/detail?no=' + item.no + '">' + hiddenNo + title + content + '</div>';
                        $('#weekly-board-list').append(postWrapper);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        }

        getWeeklyTopBoardList();
        setInterval(getWeeklyTopBoardList, 300000); // 5 minutes = 300000 milliseconds

        $(document).on('click', '.single-post-wrapper', function () {
            window.location.href = $(this).data('url');
        });
    });

    let searchValueTag = document.querySelector("input[name=searchValue]");
    searchValueTag.value = '${paramMap.searchValue}';

    const searchTypeTagArr = document.querySelectorAll("select[name=searchType] > option");

    const  x = '${paramMap.searchType}';

    if(x === 'title'){
        searchTypeTagArr[0].selected = true;
    }else if( x === 'content'){
        searchTypeTagArr[1].selected = true;
    }

</script>




