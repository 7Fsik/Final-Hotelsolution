<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>사내게시판 목록조회합시다</title>
  <link rel="stylesheet" href="${root}/resources/css/companyboard/detail.css">
  <script defer src="${root}/resources/js/companyboard/detail.js"></script>
</head>

<body>

<div id="wrap">


    <%@ include file="/WEB-INF/views/common/main.jsp" %>
    <div id="mainboard">
      <div class="main-content">
          <div class="main-content-wrap">
              <div class="writer-container">
                  <div class="titleAndWriterDate">
                      <span class="detail-title">
                          게시판 제목이에요 ㅎㅎ
                      </span>
                      <span>
                          2023.07.18
                      </span>
                  </div>

                  <div class="writer-profile-box">
                      <span class="detail-writer">
                          작성자
                      </span>
                      <span>
                          카테고리이름
                      </span>
                  </div>

              </div>
              <div class="detail-container">
                  게시글 쓰면 여기로와요 ㅇㅇ
              </div>
              <div class="comment-box">
                  0개의 댓글
                  <hr>
                  <div class="comment-container">
                      <span class="comment-writer-text"></span>
                      <span class="comment-writer-btn"></span>
                  </div>
              </div>
          </div>
      </div>
    </div>
  </main>

</div>

</body>
</html>