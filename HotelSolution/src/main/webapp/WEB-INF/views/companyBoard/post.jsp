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
            <form action="${root}/board/post" method="post" onsubmit="return validateForm();">

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
                    <label for="write-title"></label><input id="write-title" type="text" class="form-control" name="title" placeholder="제목을 입력해주세요" oninput="limitTextLength(this, 15);">
                </div>
                <hr class="horizon-line">

                <div class="write-area">
                    <label for="editor"></label>
                    <label for="editor-data"></label>
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

        resize_enable : true,

        removePlugins: 'resize',


        enterMode : CKEDITOR.ENTER_BR,

        shiftEnterMode : CKEDITOR.ENTER_P,

        filebrowserUploadUrl : "${root}/board/upload",

        height : 440,
        // AutoImage 플러그인 추가


    };

    CKEDITOR.replace("editor-data", ckeditor_config
    );

    function validateForm() {
        let editor = CKEDITOR.instances["editor-data"];
        let editorContent = editor.getData();

        // CKEditor의 내용이 비어 있거나 공백으로만 이루어졌다면 경고 및 폼 제출 취소
        if (editorContent.trim() === "") {
            alert("내용을 입력해주세요.");
            return false;
        }

        // 모든 유효성 검사 통과 시 폼 제출
        return true;
    }

    
    function limitTextLength(inputElement, maxLength) {
        // 입력된 텍스트의 길이
        let textLength = inputElement.value.length;

        // 최대 글자수보다 길게 입력했다면 현재 입력된 텍스트에서 최대 글자수만큼 잘라서 값을 설정합니다.
        if (textLength > maxLength) {
            inputElement.value = inputElement.value.slice(0, maxLength);
            alert("최대 한글 기준 15자까지 입력 가능합니다.");
        }
    }
</script>


</html>