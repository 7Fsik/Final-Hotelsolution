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
                              <button type="button" id="writer-comment-btn" class="btn btn-primary">댓글 등록하기</button>
                          </span>
                  </div>
                  <hr>
                  <div class="comment-info-area">
                      <div class="comment-page-area">

                      </div>
                      <button type="button" id="first-page-btn" class="btn btn-primary">&lt;&lt;</button>
                      <button type="button" id="last-page-btn" class="btn btn-primary">&gt;&gt;</button>
                  </div>
              </div>
          </div>
      </div>
    </div>

</div>

</body>
</html>

<script>

    $(document).ready(function() {


        $(".comment-page-area").css({
            "display": "flex",
            "justify-content": "center",
        });

        $(".comment-info-area").css({
            "max-height": "200px",
            "overflow-y": "auto",
            "margin-left" : "10px",
        });

        document.getElementById("first-page-btn").addEventListener("click", function () {
            loadBoardCommentList(1);
        });

        document.getElementById("last-page-btn").addEventListener("click", function () {
            // 아래의 수식을 사용하여 "currentPage" 값이 "totalPage"를 초과하지 않도록 제한합니다.
            loadBoardCommentList(Math.min(currentPage + 1, totalPages));
        });

        $("#writer-comment-btn").on("click", function() {
            writeCommentBtn();
        });



    });


    function companyBoardEdit(){
        window.location.href= "${root}/board/edit?no=${companyBoardVo.no}";
    }

    function companyBoardDrop(){
        if(confirm("삭제하시겠습니까?")){
            window.location.href= "${root}/board/drop?no=${companyBoardVo.no}"
        }else{

        }
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
            }
            ,success: (x) => {
                console.log(x);
                if (x === 'success') {
                    alert('댓글 작성성공');
                    document.querySelector("input[type=text][name=commentContent]").value = '';
                    loadBoardCommentList(1); // 댓글을 작성한 후 목록을 새로 고침합니다.
                } else {
                    alert("댓글 작성실패");
                }
            },
            error: (x) => {
                console.log(x);
            }
        });
    }

    function loadBoardCommentList(currentPage){
        const commentInfoArea = document.querySelector(".comment-info-area");
        const commentPageArea = document.querySelector(".comment-page-area");

        function updatePagination(pageVo, maxPage) {
            const commentPageArea = $(".comment-page-area");

            // 페이지 영역을 비웁니다.
            commentPageArea.empty();

            // 이전 버튼 추가
            if (pageVo.currentPage > 1) {
                $('<a class="btn btn-primary" href="#">&lt;</a>')
                    .appendTo(commentPageArea)
                    .click(() => loadBoardCommentList(pageVo.currentPage - 1));
            }

            // 페이지 번호 추가
            for (let i = pageVo.startPage; i <= pageVo.endPage; i++) {
                $('<a class="btn btn-primary' + (i === pageVo.currentPage ? ' active' : '') + '" href="#">' + i + '</a>')
                    .appendTo(commentPageArea)
                    .click(() => loadBoardCommentList(i));
            }

            // 다음 버튼 추가 (maxPage를 넘어갈 때는 표시되지 않도록 변경)
            if (pageVo.currentPage < pageVo.totalPages && pageVo.currentPage < maxPage) {
                $('<a class="btn btn-primary" href="#">&gt;</a>')
                    .appendTo(commentPageArea)
                    .click(() => loadBoardCommentList(pageVo.currentPage + 1));
            }
        }

        $.ajax({
            type : "get"
            ,url: "${root}/board/comment/list"
            ,data:{
                boardNo: "${companyBoardVo.no}"
                ,page : currentPage,
            }
            ,dataType :"json"
            ,success: function (response) {
                const commentList = response.commentList;
                const pageVo = response.pageVo;

                // 기존 댓글 목록을 비웁니다.
                commentInfoArea.innerHTML = "";

                // 댓글 목록을 동적으로 추가합니다.
                commentList.forEach((comment) => {
                    const commentElement = document.createElement("div");
                    commentElement.className = "comment";

                    const commentInfo = document.createElement("div");
                    commentInfo.className = "comment-info";

                    // writer, enrollDate 요소 추가
                    const commentNo = document.createElement("span");
                    commentNo.className = "comment-writer-no";
                    commentNo.textContent = comment.commentNo;

                    const writerName = document.createElement("span");
                    writerName.className = "comment-writer-name";
                    writerName.textContent = comment.writerName;

                    const enrollDate = document.createElement("span");
                    enrollDate.className = "comment-date";
                    enrollDate.textContent = comment.enrollDate;

                    const commentContent = document.createElement("div");
                    commentContent.className = "comment-content";
                    commentContent.textContent = comment.commentContent;

                    const editBtn = document.createElement("button");
                    editBtn.textContent = "수정";
                    editBtn.classList.add("btn");
                    editBtn.classList.add("btn-primary");
                    editBtn.classList.add("comment-edit-btn");
                    editBtn.addEventListener("click", function () {
                        // 수정 기능 구현
                    });

                    const deleteBtn = document.createElement("button");
                    deleteBtn.textContent = "삭제";
                    deleteBtn.classList.add("btn");
                    deleteBtn.classList.add("btn-danger");
                    deleteBtn.classList.add("comment-delete-btn");
                    deleteBtn.addEventListener("click", function () {
                        // 삭제 기능 구현
                    });

                    commentInfo.appendChild(commentNo);
                    commentInfo.appendChild(writerName);
                    commentInfo.appendChild(enrollDate);
                    commentElement.appendChild(commentInfo);
                    commentElement.appendChild(commentContent);
                    commentElement.appendChild(editBtn);
                    commentElement.appendChild(deleteBtn);
                    commentInfoArea.appendChild(commentElement);
                    commentInfoArea.appendChild(document.createElement("hr"));
                });

                commentInfoArea.appendChild(commentPageArea);
                updatePagination(pageVo);

                $('.comment-delete-btn').on('click',function (){
                    let commentNo = document.querySelector('.comment-writer-no').textContent;

                    $.ajax({
                        url : "${root}/board/comment/delete"
                        ,type : "POST"
                        ,data : {
                            boardNo : ${companyBoardVo.no} //게시글번호
                            ,commentNo : commentNo,
                        }
                        ,success: (x) => {
                            console.log(x);
                            if (x === 'success') {
                                alert('댓글 삭제성공');
                                loadBoardCommentList(1); // 댓글을 작성한 후 목록을 새로 고침합니다.
                            } else {
                                alert("댓글 삭제실패");
                            }
                        },
                        error: (x) => {
                            console.log(x);
                        }
                    });
                });

                $(".comment-edit-btn").on("click", function () {
                    // 수정할 댓글의 번호와 내용을 가져옵니다.
                    const commentNo = document.querySelector('.comment-writer-no').textContent;
                    const commentContent = $(this).siblings(".comment-content");

                    // 댓글 수정 입력창이 있는지 검사하고 없으면 생성���니다.
                    if (!$("#comment-edit-input").length) {
                        const commentEditInput = $("<input>").attr({ type: "text", id: "comment-edit-input" }).val(commentContent.text());
                        const commentEditSubmitBtn = $("<button>").addClass("btn btn-primary comment-edit-submit-btn").text("완료");
                        const commentEditCancelBtn = $("<button>").addClass("btn btn-secondary comment-edit-cancel-btn").text("취소");

                        // 수정 입력창, 완료 및 취소 버튼 추가
                        commentContent.after(commentEditInput);
                        commentEditInput.after(commentEditSubmitBtn);
                        commentEditSubmitBtn.after(commentEditCancelBtn);

                        // 수정 완료 버튼 클릭 이벤트
                        commentEditSubmitBtn.on("click", function () {
                            const updatedCommentContent = $("#comment-edit-input").val();

                            // 여기에 댓글 수정을 처리하는 AJAX 요청을 추가하세요.
                            $.ajax({
                                url : "${root}/board/comment/edit"
                                ,type : "POST"
                                ,data : {
                                    boardNo : ${companyBoardVo.no} //게시글번호
                                    ,commentNo : commentNo
                                    ,commentContent : updatedCommentContent
                                }
                                ,success: (x) => {
                                    console.log(x);
                                    if (x === 'success') {
                                        alert('댓글 수정성공');
                                        loadBoardCommentList(1); // 댓글을 작성한 후 목록을 새로 고침합니다.
                                    } else {
                                        alert("댓글 수정실패");
                                    }
                                },
                                error: (x) => {
                                    console.log(x);
                                }
                            });

                            // 댓글이 수정되면 수정 입력창과 버튼을 제거하고 새로 고침합니다.
                            commentContent.text(updatedCommentContent);
                            commentEditInput.remove();
                            commentEditSubmitBtn.remove();
                            commentEditCancelBtn.remove();
                        });

                        // 수정 취소 버튼 클릭 이벤트
                        commentEditCancelBtn.on("click", function () {
                            commentEditInput.remove();
                            commentEditSubmitBtn.remove();
                            commentEditCancelBtn.remove();
                        });
                    }
                });

            },
        });




    }






    document.getElementById("comment-input-text").addEventListener("keydown", (event)=>{

        if(event.key === "Enter"){
            event.preventDefault();
            writeCommentBtn();
        }
    });


    loadBoardCommentList(1);


</script>

