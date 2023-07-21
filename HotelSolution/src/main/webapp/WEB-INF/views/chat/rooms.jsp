<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
</head>
<body>
  <div class="container">
    <div>
      <ul>
        <c:forEach items="${list}" var="room">
          <li><a href="${root}/chat/room?roomNo=${room.no}" class="at">${room.no}</a></li>
        </c:forEach>
      </ul>
    </div>
  </div>
  <form action="${root}/chat/room" method="post">
    <input type="text" name="no" class="form-control">
    <button class="btn btn-secondary">개설하기</button>
  </form>

  <script>
    $(document).ready(function(){
    	var roomName = document.querySelector(".at").innerText;


      if(roomName != null)
        alert(roomName + "과 연결되었습니다.");

      $(".btn-create").on("click", function(e){
        e.preventDefault();

        var name = $("input[name='no']").val();

        if(name == "")
          alert("채팅 희망 사원번호를 입력하세요");
        else
          $("form").submit();
      });
    });
  </script>
</body>
</html>
