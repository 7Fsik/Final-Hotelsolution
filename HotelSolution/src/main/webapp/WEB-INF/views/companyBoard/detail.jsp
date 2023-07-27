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
                  <div class="comment-cnt">0개의 댓글</div>
                  <div class="comment-write-container">
                          <span class="comment-writer-text">
                          <input type="hidden" name="no" value="${companyBoardVo.no}">
                          <label>
                            <input id="comment-input-text" class="form-control" name="commentContent" type="text" placeholder="댓글을 입력해주세요" maxlength="40">
                          </label>
                          </span>
                              <span class="comment-writer-btn">
                              <button type="button" id="writer-comment-btn" onclick="writeCommentBtn()"  class="btn btn-primary">댓글 등록하기</button>
                          </span>
                  </div>
                  <hr>
                  <div class="comment-info-area">

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



    function writeCommentBtn(){
        let commentContent = document.querySelector("input[type=text][name=commentContent]").value;

        if(commentContent.trim() === ""){
            alert("내용을입력해주세요.");
            return;
        }
        $.ajax({
            url : "${root}/board/comment/write"
            ,type : "POST"
            ,data : {
                boardNo : ${companyBoardVo.no} //게시글번호
                ,commentContent : commentContent, //댓글내용
            },
            success: (x) => {
                console.log(x);
                if (x === 'success') {
                    alert('댓글 작성성공');
                    document.querySelector("input[type=text][name=commentContent]").value = '';
                } else {
                    alert("댓글 작성실패");
                }
            },
            error: (x) => {
                console.log(x);
            }
        });
    }

    function loadBoardCommentList(){
        $.ajax({
            type : "get",
            url : "${root}/board/comment/list",
            data : {"no": $("no").val()},
            success : function (data){
                let html = "";
                const count = data.list.lenth;
            }


        });
    }

    document.getElementById("comment-input-text").addEventListener("keydown", (event)=>{

        if(event.key === "Enter"){
            event.preventDefault();
            writeCommentBtn();
        }
    });



</script>

