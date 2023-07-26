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
    <link rel="stylesheet" href="${root}/resources/css/companyboard/detail.css">
    <script src="${root}/resources/ckeditor/ckeditor.js"></script>
    <script defer src="${root}/resources/js/companyboard/detail.js"></script>
    <div id="mainboard">
      <div class="main-content">
          <div class="main-content-wrap">
              <div class="writer-container">
                  <div class="titleAndWriterDate">
                      <span class="detail-title">
                          제목
                          ${companyBoardVo.title}
                      </span>
                      <span>
                          ${companyBoardVo.enrollDate}
                      </span>
                      <c:if test="${sessionScope.loginMember.no eq companyBoardVo.writerNo}">
                          <button type="button" onclick="companyBoardEdit();">수정하기</button>
                          <button type="button" onclick="companyBoardDrop();">삭제하기</button>
                      </c:if>
                  </div>

                  <div class="writer-profile-box">
                      <span>
                          ${companyBoardVo.writerName}
                      </span>
                  </div>

              </div>
              <hr>

              <div id="content" contenteditable="false">
                  ${companyBoardVo.content}
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

</div>

</body>
</html>

<script>

    function companyBoardEdit(){
        window.location.href= "${root}/board/drop";
    }

    function companyBoardDrop(){
        alert("삭제하시겠습니까?");
        window.location.href= "${root}/board/delete"

    }

</script>

