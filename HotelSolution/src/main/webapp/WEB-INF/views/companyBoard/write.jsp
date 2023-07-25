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
    <link rel="stylesheet" href="${root}/resources/css/companyboard/write.css">
    <script defer src="${root}/resources/js/companyboard/write.js"></script>
    <script src="${root}/resources/ckeditor/ckeditor.js"></script>
    <div id="mainboard">
        <div class="write-container">
            <form action="${root}/board/post" method="post">

                <div class="write-container">
                    <label>
                        <select class="form-select category-btn" name="categoryNo" required>
                            <option disabled="disabled" selected value="">주제 선택</option>
                            <c:forEach var="vo" items="${categoryList}">
                                <option value="${vo.categoryNo}">${vo.categoryName}</option>
                            </c:forEach>
                        </select>
                    </label>
                    <div class="write-btn">
                        <input class="btn btn-primary" type="submit" value="글쓰기">
                    </div>
                </div>

                <div class="input-group mb-3">
                    <label for="write-title"></label><input id="write-title" type="text" class="form-control" name="title" placeholder="제목을 입력해주세요 ㅎㅎ">
                </div>
                <hr class="horizon-line">

                <div class="write-area">
                    <label for="editor"></label>
                    <textarea id="editor-data" name="content" class="custom-toolbar">
                        </textarea>
                </div>

            </form>
        </div>
    </div>

</div>

</body>

<script>
    const ckeditor_config = {

        resize_enaleb : false,

        enterMode : CKEDITOR.ENTER_BR,

        shiftEnterMode : CKEDITOR.ENTER_P,

        filebrowserUploadUrl : "${root}/board/upload"
    };

    CKEDITOR.replace("editor-data", ckeditor_config);


</script>


</html>